//: Playground - noun: a place where people can play

import UIKit


//Players

let players: [Dictionary<String, Any>] = [
    
    ["name": "Joe Smith", "height": 42.0 , "soccerExperience": true, "guardianName": "Jim and Jan Smith"],
    ["name": "Jill Tanner", "height": 36.0 , "soccerExperience": true , "guardianName": "Clara Tanner"],
    ["name": "Bill Bon", "height": 43.0  , "soccerExperience": true , "guardianName": "Sara and Jenny Bon"],
    ["name": "Eva Gordon", "height": 45.0 , "soccerExperience": false , "guardianName": "Wendy and Mike Gordon"],
    ["name": "Matt Gill", "height": 40.0  , "soccerExperience": false, "guardianName": "Charles and Sylvia Gill"],
    ["name": "Kimmy Stein", "height": 41.0  , "soccerExperience": false , "guardianName": "Bill and Hillary Stein"],
    ["name": "Sammy Adams", "height": 45.0 , "soccerExperience": false , "guardianName": "Jeff Adams"],
    ["name": "Karl Saygan", "height": 42.0  , "soccerExperience": true , "guardianName": "Heather Bledsoe"],
    ["name": "Suzane Greenberg", "height": 44.0 , "soccerExperience": true , "guardianName": "Henrietta Dumas"],
    ["name": "Sal Dali", "height": 41.0  , "soccerExperience": false, "guardianName": "Gala Dali"],
    ["name": "Joe Kavalier", "height": 39.0  , "soccerExperience": false , "guardianName": "Sam and Elaine Kavalier"],
    ["name": "Ben Finkelstein", "height": 44.0  , "soccerExperience": false , "guardianName": "Aaron and Jill Finkelstein"],
    ["name": "Diego Soto", "height": 41.0 , "soccerExperience": true , "guardianName": "Robin and Sarika Soto"],
    ["name": "Chloe Alaska", "height": 47.0  , "soccerExperience": false, "guardianName": "David and Jamie Alaska"],
    ["name": "Arnold Willis", "height": 43.0  , "soccerExperience": false, "guardianName": "Claire Willis"],
    ["name": "Phillip Helm", "height": 44.0 , "soccerExperience": true, "guardianName": "Thomas Helm and Eva Jones"],
    ["name": "Les Clay", "height": 42.0 , "soccerExperience": true , "guardianName": "Wynonna Brown"],
    ["name": "Herschel Krustofski", "height": 45.0  , "soccerExperience": true, "guardianName": "Hyman and Rachel Krustofski"],
]

//Team variables

var teamSharks: [Dictionary<String, Any>] = []
var teamSharksHeights: [Double] = []
var teamSharksAvgHeight: Double = 0
var teamDragons: [Dictionary<String, Any>] = []
var teamDragonsHeights: [Double] = []
var teamDragonsAvgHeight: Double = 0
var teamRaptors: [Dictionary<String, Any>] = []
var teamRaptorsHeights  : [Double] = []
var teamRaptorsAvgHeight: Double = 0

var experiencedPlayers: [Dictionary<String, Any>] = []
var firstTimers: [Dictionary<String, Any>] = []

var experiencedHeights: [Double] = []
var experiencedAvgHeight: Double = 0
var firstTimersHeights: [Double] = []
var teamsAverageHeight: Double = 0
var preTeamsAverageHeight: Double = 0

//Sorting players by height and experience into seperate arrays

var heights: [Double] = []

func seperateIntoExperienceGroups() {
    for player in players {
        if let height = player["height"] as? Double {
            heights.append(height)
        }
    
    }

    for player in players {
        if let experience = player["soccerExperience"] as? Bool {
            if experience == true {
                experiencedPlayers.append(player)
            } else {
                firstTimers.append(player)
            }
        }
    }
}

seperateIntoExperienceGroups()

////////////////Separating players into teams by experience and height.//////////////////

//Functions for height seperation

func addPlayersHeightTo(teamHeightArray: inout [Double], team: [[String:Any]]) -> [Double] {
    
    for player in team {
        
        if let height = player["height"] as? Double{
            teamHeightArray.append(height)
        }
    }
    return teamHeightArray
}

func getAverageHeightOf(team: [Double]) -> Double {
    preTeamsAverageHeight = 0
    
    for playerHeight in team {
        
        preTeamsAverageHeight += playerHeight
    }
    
    teamsAverageHeight = preTeamsAverageHeight / Double(team.count)
    return teamsAverageHeight
}

//Lining up players shortest to tallest

let sortedExperiencedPlayers = experiencedPlayers.sorted { (playerOne, playerTwo) -> Bool in
    let playerOneHeight = (playerOne["height"] as? Double) ?? 0
    let playerTwoHeight = (playerTwo["height"] as? Double) ?? 0
    
    return playerOneHeight < playerTwoHeight
}

let sortedFirstTimers = firstTimers.sorted { (playerOne, playerTwo) -> Bool in
    let playerOneHeight = (playerOne["height"] as? Double) ?? 0
    let playerTwoHeight = (playerTwo["height"] as? Double) ?? 0
    
    return playerOneHeight > playerTwoHeight
}

//Actually seperating teams

func seperateByExperienceAndHeight() -> ([[String:Any]], [[String:Any]], [[String:Any]], Double, Double, Double) {
    
    let playersCount = sortedExperiencedPlayers.count
    
    for player in (0...(playersCount-1)) {
        
        let currentPlayer = sortedExperiencedPlayers[player]
        
        if player % 3 == 0 {
            
            teamSharks.append(currentPlayer)
            
        } else if player % 3 == 1 {
            
            teamDragons.append(currentPlayer)
            
        } else if player % 3 == 2 {
            
            teamRaptors.append(currentPlayer)
        }
    }
    
    let playersCountFirst = sortedFirstTimers.count
    
    for player in (0...(playersCountFirst-1)) {
        
        let currentPlayer = sortedFirstTimers[player]
        
        if player % 3 == 0 {
            
            teamSharks.append(currentPlayer)
            
        } else if player % 3 == 1 {
            
            teamDragons.append(currentPlayer)
            
        } else if player % 3 == 2 {
            
            teamRaptors.append(currentPlayer)
        }
        
    }
    
    return (teamSharks, teamDragons, teamRaptors, teamSharksAvgHeight, teamDragonsAvgHeight, teamRaptorsAvgHeight)
}

seperateByExperienceAndHeight()

//Average heights

addPlayersHeightTo(teamHeightArray: &teamSharksHeights, team: teamSharks)
getAverageHeightOf(team: teamSharksHeights)

addPlayersHeightTo(teamHeightArray: &teamDragonsHeights, team: teamDragons)
getAverageHeightOf(team: teamDragonsHeights)


addPlayersHeightTo(teamHeightArray: &teamRaptorsHeights, team: teamRaptors)
getAverageHeightOf(team: teamRaptorsHeights)

// Team letters

let dragonsPractice = "March 17, 1pm"
let sharksPractice = "March 17, 3pm"
let raptorsPractice = "March 18, 1pm"

var letters: [String] = []
func raptorsLetters() -> [String] {
    
    for player in teamRaptors {
        let playerName = player["name"] ?? 0
        let guardianName = player["guardianName"] ?? 0
        
        let letter = ("Welcome \(playerName) and \(guardianName), to the Raptors. Our first practice will be \(raptorsPractice). See you soon!")
        letters.append(letter)
        
    }
    
    return letters
}

func dragonsLetters() -> [String] {
    
    for player in teamDragons {
        let playerName = player["name"] ?? 0
        let guardianName = player["guardianName"] ?? 0
        
        let letter = ("Welcome \(playerName) and \(guardianName), to the Dragons. Our first practice will be \(dragonsPractice). See you soon!")
        letters.append(letter)
        
    }
    
    return letters
}

func sharksLetters() -> [String] {
    
    for player in teamSharks {
        let playerName = player["name"] ?? 0
        let guardianName = player["guardianName"] ?? 0
        
        let letter = ("Welcome \(playerName) and \(guardianName), to the Sharks. Our first practice will be \(sharksPractice). See you soon!")
        letters.append(letter)
        
    }
    
    return letters
}

raptorsLetters()
dragonsLetters()
sharksLetters()

print(letters)

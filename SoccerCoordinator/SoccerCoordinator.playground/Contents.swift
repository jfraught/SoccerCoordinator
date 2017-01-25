//Single collections of all players and dictionaries of players

var players = [
 ["Name": "Joe Smith", "Height(inches)": 42, "Soccer Experience": true, "Guardian Names(s)": "Jim and Jan Smith"],
 ["Name": "Jill Tanner", "Height(inches)": 36, "Soccer Experience": true, "Guardian Names(s)": "Clara Tanner"],
 ["Name": "Bill Bon", "Height(inches)": 43, "Soccer Experience": true, "Guardian Names(s)": "Sara and Jenny Bon"],
 ["Name": "Eva Gordon", "Height(inches)": 45, "Soccer Experience": false, "Guardian Names(s)": "Wendy and Mike Gordon"],
 ["Name": "Matt Gil", "Height(inches)": 40, "Soccer Experience": false, "Guardian Names(s)": "Charles and Sylvia Gill"],
 ["Name": "Kimmy Stein", "Height(inches)": 41, "Soccer Experience": false, "Guardian Names(s)": "Bill and Hillary Stein"],
 ["Name": "Sammy Adams", "Height(inches)": 45, "Soccer Experience": false, "Guardian Names(s)": "Jeff Adams"],
 ["Name": "Karl Saygan", "Height(inches)": 42, "Soccer Experience": true, "Guardian Names(s)": "Heather Bledsoe"],
 ["Name": "Suzane Greenberg", "Height(inches)": 44, "Soccer Experience": true, "Guardian Names(s)": "Henrietta Dumas"],
 ["Name": "Sal Dali", "Height(inches)": 41, "Soccer Experience": false, "Guardian Names(s)": "Gala Dali"],
 ["Name": "Joe Kavalier", "Height(inches)": 39, "Soccer Experience": false, "Guardian Names(s)": "Sam and Elaine Kavalier"],
 ["Name": "Ben Finkelstein", "Height(inches)": 44, "Soccer Experience": false, "Guardian Names(s)": "Aaron and Jill Finkelstein"],
 ["Name": "Diego Soto", "Height(inches)": 41, "Soccer Experience": true, "Guardian Names(s)": "Robin and Sarika Soto"],
 ["Name": "Chloe Alaska", "Height(inches)": 47, "Soccer Experience": false, "Guardian Names(s)": "David and Jamie Alaska"],
 ["Name": "Arnold Willis", "Height(inches)": 43, "Soccer Experience": false, "Guardian Names(s)": "Claire Willis"],
 ["Name": "Phillip Helm", "Height(inches)": 44, "Soccer Experience": true, "Guardian Names(s)": "Thomas Helm and Eva Jones"],
 ["Name": "Les Clay", "Height(inches)": 42, "Soccer Experience": true, "Guardian Names(s)": "Wyonna Brown"],
 ["Name": "Herschei Krustofski", "Height(inches)": 45, "Soccer Experience": true, "Guardian Names(s)": "Hyman and Rachel Krustofski"]
]


//Seperating players into teams

var teamSharks: [[String: Any]] = []
var teamDragons: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []

//Created two arrays to make it easier to see who had experience and who was a first time player. Added players to the array using a for in loop.

var experiencedPlayers: [[String: Any]] = []
var firstTimePlayers: [[String: Any]] = []

for player in players {
    if let hasExperience = player["Soccer Experience"] as? Bool,
        hasExperience == true {
    experiencedPlayers.append(player)
    } else {
        firstTimePlayers.append(player)
    }
}

//



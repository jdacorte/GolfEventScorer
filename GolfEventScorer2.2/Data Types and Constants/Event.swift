//
//  EventData.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct Event: Identifiable { // Event and Game used to have Hashable with them-not sure that is needed
    var id = UUID()  // change others to let instead of vars-is that true?
    var name = "New Event"
    var date = Date.now
    var useHandicap = false
    var playingTeams = false
//    var players = [PlayerData]()
//    var playersAvailable = [PlayerData]()
    
    var games = [Game]()
//    var teams = [TeamData]()
//    var scorecardHeader = [ScorecardHeaderData]()
//    var scorecardSinglePlayer = [ScorecardResultData]()
//    var scorecard = [[ScorecardResultData]]()
//    var scorecardOffset = 0
}

struct Game: Identifiable, Hashable {
    var id = UUID()
    var type = "Select Game"
    var course = "Select Course"
    var holesToPlay = Array(repeating: false, count: 19)
    var holesToPlayCount : Int {
        var count = 0
        for i in 0..<19 {
            if holesToPlay[i] == true {
                count += 1
            }
        }
        return count
    }
}

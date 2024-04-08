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
    var started = false
    var useHandicap = false
    var playingTeams = false
    var playersInEvent = [Player]()
    var games = [Game]()
    var totalEventHoles = 0
//    var teams = [TeamData]()
    var scorecardHeader = [ScorecardHeaderData]()
    var singlePlayerScorecard = [ScorecardResultData]()
    var scorecardGrid = [[ScorecardResultData]]()
}

struct Game: Identifiable, Hashable {
    var id = UUID()
    var type = "Select Game"
    var course = "Select Course"
    var holesToPlay = Array(repeating: false, count: 19)
    var totalGameHoles: Int {
        var count = 0
        for i in 0..<19 {
            if holesToPlay[i] == true {
                count += 1
            }
        }
        return count
    }
}

struct ScorecardHeaderData:Identifiable {
    var id = UUID()
    var gameSymbol: String = ""
    var courseSymbol: String = ""
    var hole: Int = 0
}

struct ScorecardResultData: Identifiable {
    var id = UUID()
    var par: Int = 0
    var strokeIndex: Int = 0
    var strokes: Int = 0
    var rawScore: Int = 0
    var rawToPar: Int {
        return rawScore - par
    }
    var hCPScore: Int {
        return rawScore - strokes
    }
    var hCPScoreToPar: Int {
        return rawScore - strokes - par
    }
}

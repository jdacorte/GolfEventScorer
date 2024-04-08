//
//  EventScorecard Functions.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/23/24.
//

import SwiftUI

extension GolfEventScorer {
    
    func createEventScorecard(_ event: Event) {
        
        createEventScorecardHeader(event)
        createEventScorecardSinglePlayer(event)
        modifyPlayersInScorecardGrid(event, newPlayerList: event.playersInEvent)
        addPlayerSpecificHoleInfoToScorecardGrid(event)
    }
    
    func addPlayerSpecificHoleInfoToScorecardGrid(_ event: Event) {
        let eventIndex = getEventIndex(event)
        for (playerIndex, player) in events[eventIndex].playersInEvent.enumerated() {
            var holeCount = 0
            for game in events[eventIndex].games {
                let courseIndex = courses.firstIndex(where: {$0.name == game.course}) ?? 0
                for hole in 1..<19 {
                    if game.holesToPlay[hole] {
                        events[eventIndex].scorecardGrid[playerIndex][holeCount] =
                        getPlayerSpecificHoleInfo(player: player, course: courses[courseIndex], hole: hole)
                    }
                    holeCount += 1
                    
                }
            }
            // kkhjkjh
            // find the par and si and yards for the player and the hole of the game
            // need to know the player tee and hi, course, hole, tees to find
        }
    }
    
    func getPlayerSpecificHoleInfo(player: Player, course: Course, hole: Int)->ScorecardResultData {
        //        find the course handicap for the player from the player's tees
        let teeIndex = course.tees.firstIndex(where: {$0.color == player.teeChoice}) ?? 0
        let teeSlope = course.tees[teeIndex].slope ?? 0
        let teeRating = course.tees[teeIndex].rating ?? 0
        let teeParTotal = course.tees[teeIndex].parTotal ?? 0
        let playerHI = player.hi
        let playerCourseHCP = 5
//        let playerCourseHCP = (Int((playerHI * Double(teeSlope)/113) + teeRating - Double(teeParTotal) + 0.5))
        

// find par, stroke index, and strokes for the hole
        var scorecardResultData = ScorecardResultData()
        scorecardResultData.par = course.tees[teeIndex].holes[hole].par ?? 0
        let strokeIndex = course.tees[teeIndex].holes[hole].strokeIndex ?? 0
        scorecardResultData.strokeIndex = strokeIndex
        scorecardResultData.strokes = findStrokesForPlayer(playerHCP: playerCourseHCP, holeSI: strokeIndex)
        return scorecardResultData
    }
    
    func findStrokesForPlayer(playerHCP: Int, holeSI: Int)->Int {
        var strokes = 0
        var tempHCP = playerHCP
        if playerHCP <= 0 {
            if (18 - holeSI + playerHCP) < 0 {
                return -1
            } else {
                return 0
            }
        } else {
            while (tempHCP > 0) {
                if tempHCP >= holeSI {
                    strokes += 1
                }
                tempHCP -= 18
            }
            return strokes
        }
    }
    
    func modifyPlayersInScorecardGrid(_ event: Event, newPlayerList: [Player]) {
        print("modify players on grid")
//      save existing data in old scorecard grid
        let eventIndex = getEventIndex(event)
        let oldScorecardGrid = event.scorecardGrid
        let oldPlayerList = event.playersInEvent
        
//      clear the existing grid
        events[eventIndex].scorecardGrid.removeAll()

//      add the right number of players to the new Grid
        print("newPlayerList.count is \(newPlayerList.count)")
        for _ in 0..<newPlayerList.count {
            events[eventIndex].scorecardGrid.append(events[eventIndex].singlePlayerScorecard)
           
        }
        //      use the new player list and the old player list to fill in the data to the old grid
        
        events[eventIndex].playersInEvent.removeAll() // can this line be removed-i think so
        events[eventIndex].playersInEvent = newPlayerList
        
//        addPlayerToScorecard
   
        for (playerIndex, player) in newPlayerList.enumerated() {
            if let indexOldPlayer = oldPlayerList.firstIndex(where: { $0.id == player.id }) {
                for hole in 0..<event.totalEventHoles {
                    events[eventIndex].scorecardGrid[playerIndex][hole] = oldScorecardGrid[indexOldPlayer][hole]
                }
            }
        }
    }
    
    
    func createEventScorecardSinglePlayer(_ event: Event) {
        print("create single player")
        let eventIndex = getEventIndex(event)
        for _ in 0..<events[eventIndex].totalEventHoles {
            events[eventIndex].singlePlayerScorecard.append(ScorecardResultData())
        }
    }
    
    func createEventScorecardHeader(_ event: Event) {
        print("create header")
        let eventIndex = getEventIndex(event)
        
        var count = 0
        for game in events[eventIndex].games {
            count += game.totalGameHoles
        }
        events[eventIndex].totalEventHoles = count
        events[eventIndex].scorecardHeader.removeAll()
        for _ in 0..<events[eventIndex].totalEventHoles {
            events[eventIndex].scorecardHeader.append(ScorecardHeaderData())
        }
        
        var headerIndex = 0
        for game in events[eventIndex].games {
            for holeNum in 1..<19 {
                if game.holesToPlay[holeNum] == true {
                    
                    // need to add code to put actual game and course symbol
                    events[eventIndex].scorecardHeader[headerIndex].gameSymbol = "St"
                    events[eventIndex].scorecardHeader[headerIndex].courseSymbol = "Ke"
                    events[eventIndex].scorecardHeader[headerIndex].hole = holeNum
                    headerIndex += 1
                }
            }
        }
    }
    
//    func buildEventScorecardGrid(_ event: Event) {
//        let eventIndex = getEventIndex(event)
//        var copyOfScorecardGrid = events[eventIndex].scorecardGrid
//        createEventScorecardHeader(event)
//        createEventScorecardSinglePlayer(event)
//        events[eventIndex].scorecardGrid.removeAll()
//        for _ in 0..<events[eventIndex].playersInEvent.count {
//            events[eventIndex].scorecardGrid.append(events[eventIndex].singlePlayerScorecard)
//        }
//    }
    

    func modifyEventScorecardEntry(event: Event, playerIndex: Int, entryIndex: Int, value: Int) {
        let eventIndex = getEventIndex(event)
        events[eventIndex].scorecardGrid[playerIndex][entryIndex].rawScore = value
    }
     
    // if change a player need to change grid only
    
    func setEventStarted(_ event: Event) {
        let eventIndex = getEventIndex(event)
        events[eventIndex].started = true
    }
    
    
}

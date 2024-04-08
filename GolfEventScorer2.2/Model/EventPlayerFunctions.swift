//
//  EventPlayerFunctions.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/18/24.
//

import SwiftUI

extension GolfEventScorer {
    
    func modifyPlayersInEvent(event: Event, newPlayerList: [Player]) {
        var oldScorecard = event.scorecardGrid
        var oldPlayerList = event.playersInEvent
       
        let eventIndex = getEventIndex(event)
        events[eventIndex].playersInEvent.removeAll()
        events[eventIndex].playersInEvent = newPlayerList
        
//        addPlayerToScorecard
   
        for (playerIndex, player) in newPlayerList.enumerated() {
       
//        for player in newPlayerList {
            if let indexOldPlayer = oldPlayerList.firstIndex(where: { $0.id == player.id }) {
                
                for hole in 0..<event.totalEventHoles {
                    events[eventIndex].scorecardGrid[playerIndex][hole] = oldScorecard[indexOldPlayer][hole]
                }
            }
        }
    }

}

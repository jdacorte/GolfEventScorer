//
//  GameData.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/8/24.
//

import SwiftUI

extension GolfEventScorer {
    
    func addEventGame(event: Event, game: Game) {
        events[getEventIndex(event)].games.append(game)
    }
    
    func modifyEventGame(event: Event, game: Game) {
        let eventIndex = events.firstIndex(where: { $0.id == event.id }) ?? 0
        let gameIndex = events[eventIndex].games.firstIndex(where: { $0.id == game.id }) ?? 0
        events[eventIndex].games[gameIndex] = game
    }
    
    func deleteEventGame(event: Event, game: Game) {
        events[getEventIndex(event)].games.removeAll { $0.id == game.id }
    }
}

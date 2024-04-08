//
//  GameData.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/8/24.
//

import SwiftUI

extension GolfEventScorer {
    
    func deleteEventGame(event: Event, game: Game) {
        events[getEventIndex(event)].games.removeAll { $0.id == event.id }
    }
    
    func addGame(event: Event, game: Game) {
        events[getEventIndex(event)].games.append(game)
    }
    
    func getEventIndex(_ event: Event)->Int {
        return events.firstIndex(where: {$0.id == event.id}) ?? 0
    }
    
    func getEventGameIndex(eventIndex: Int, _ game: Game)->Int {
        return events.firstIndex(where: {$0.id == game.id}) ?? 0
    }
    
    
    func modifyGame(event: Event, game: Game) {
        let eventIndex = events.firstIndex(where: { $0.id == event.id }) ?? 0
        let gameIndex = events[eventIndex].games.firstIndex(where: { $0.id == game.id }) ?? 0
        events[eventIndex].games[gameIndex] = game
//        {
//            events[getEventIndex(event)].games[getEventGameIndex(eventIndex] = game
//        }
    }
}

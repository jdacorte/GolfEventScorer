//
//  EventData.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/5/24.
//

import SwiftUI

extension GolfEventScorer {
//    @Published var players = [Player]()
//    @Published var events = [Course]()
//    @Published var events = [Event]()
//    
    func delete(_ event: Event) {
        events.removeAll { $0.id == event.id }
    }
    
    func add(_ event: Event) {
        events.append(event)
    }
    
    func modify(_ event: Event) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index] = event
        }
    }
    
    func copy(_ event: Event) {
        events.append(event)
        let lastEventIndex = events.count - 1
        events[lastEventIndex].id = UUID()
        events[lastEventIndex].name = "Copy of " + event.name
    }
    
    
}


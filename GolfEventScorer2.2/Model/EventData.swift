//
//  EventData.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/5/24.
//

import SwiftUI

extension GolfEventScorer {
 
    func deleteEvent(_ event: Event) {
        events.removeAll { $0.id == event.id }
    }
    
    func addEvent(_ event: Event) {
        events.append(event)
    }
    
    func modifyEvent(_ event: Event) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index] = event
        }
    }
    
    func copyEvent(_ event: Event) {
        events.append(event)
        let lastEventIndex = events.count - 1
        events[lastEventIndex].id = UUID()
        events[lastEventIndex].name = "Copy of " + event.name
        events[lastEventIndex].started = false
    }
    
    func getEventIndex(_ event: Event)->Int {
//        print(events.firstIndex(where: {$0.id == event.id}) ?? 0)
        return events.firstIndex(where: {$0.id == event.id}) ?? 0
    }
    
}


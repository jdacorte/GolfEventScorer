//
//  GolfEventScorer2_2App.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

@main
struct GolfEventScorer2_2App: App {
    @StateObject private var golfEventScorer = GolfEventScorer()
//    @StateObject private var eventData = EventData()
    var body: some Scene {
        WindowGroup {
            Top()
            .environmentObject(golfEventScorer)
//            .environmentObject(eventData)
        }
    }
}

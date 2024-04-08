//
//  Home.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var gES: GolfEventScorer
    var body: some View {
        VStack {
            Text("Players: \(gES.players.count)")
            Text("Courses: \(gES.courses.count)")
            Text("Events: \(gES.events.count)")
        }
        
    }
}

#Preview {
    Home()
}

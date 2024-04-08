//
//  ContentView.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct Top: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            PlayerList()
                .tabItem {
                    Label("Players", systemImage: "figure.golf")
                }
            
            CourseList()
                .tabItem {
                    Label("Courses", systemImage: "capsule.fill")
                }
            EventList()
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }
        }
    }
}

#Preview {
    Top()
}

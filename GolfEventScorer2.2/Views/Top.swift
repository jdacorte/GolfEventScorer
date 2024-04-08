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
            Players()
                .tabItem {
                    Label("Players", systemImage: "figure.golf")
                }
            
            Courses()
                .tabItem {
                    Label("Courses", systemImage: "capsule.fill")
                }
            Events()
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }
        }
    }
}

#Preview {
    Top()
}

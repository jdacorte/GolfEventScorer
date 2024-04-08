//
//  Events.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct EventList: View {
    @EnvironmentObject var gES: GolfEventScorer
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Events").font(.pageTitleFont)
                ScrollView {
                    ForEach(gES.events) { event in
                        NavigationLink {
                            EventDetail(event: event)
                        } label: {
                            EventSummary(event: event)
                        }
                    }
                }
            }
            .padding()
            .toolbar {
                NavigationLink {
                    EventEditor(event: Event(), isNew: true)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    EventList()
}

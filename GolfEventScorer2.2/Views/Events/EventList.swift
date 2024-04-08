//
//  Events.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct EventList: View {
    @Environment(GolfEventScorer.self) private var gES
    var body: some View {
        NavigationView {
            VStack {
//                Text("Events").font(.title)
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
            .navigationTitle("Events").font(.title)
            .padding()
            .toolbar {
                NavigationLink {
                    EventDetail(event: EventData())
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

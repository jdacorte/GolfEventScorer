//
//  EventDetail.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct EventDetail: View {
    @EnvironmentObject var gES: GolfEventScorer
    @Environment(\.dismiss) private var dismiss
    var event: Event
    @State private var isSelectingPlayers = false
    @State private var isShowingScorecard = false
    @State private var eventStartCaution = false
    
    
    var body: some View {
        VStack {
            Text(event.name)
                .font(.pageTitleFont)
            Text(event.date, format: .dateTime.day().month().year())
            Text("Player Handicap \(event.useHandicap ? "Included": "Not Used")")
            Button {
                isSelectingPlayers = true
            } label: {
                Text("Select Players")
            }.buttonStyle(.borderedProminent).tint(.indigo)
            GameList(event: event)
            // this should be a NavigationLink-if a presented sheet data could be lost on an accidental swipe down
            Button {
                if event.started {
                    isShowingScorecard = true
                } else {
                    eventStartCaution = true
                }
            } label: {
                if event.started {
                    Text("Scorecard")
                } else {
                    Text("Start Event")
                        .alert(K.Scorecard.eventStartCaution, isPresented: $eventStartCaution) {
                            Button("Proceed", role: .none) {
                                gES.createEventScorecard(event)
                                isShowingScorecard = true
                            }
                            Button("Cancel", role: .cancel) { }
                        }
                }
                
            }.buttonStyle(.borderedProminent).tint(.indigo)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Button {
                    gES.deleteEvent(event)
                    dismiss()
                } label: {
                    Label("", systemImage: "trash")
                        .foregroundColor(.red)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    gES.copyEvent(event)
                    dismiss()
                } label: {
                    Label("", systemImage: "doc.on.doc")
                        .foregroundColor(.blue)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    EventEditor(event: event, isNew: false)
                } label: {
                    Label("", systemImage: "pencil")
                        .foregroundColor(.blue)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isShowingScorecard) {
            NavigationView {
                EventScorecard(event: event)
            }
        }
        .sheet(isPresented: $isSelectingPlayers) {
            // should this not be a navigation view
            NavigationView {
                EventPlayerSelector(event: event)
            }
        }
        
        .padding()
    }
}

//#Preview {
//    EventDetail(event: Event())
//}

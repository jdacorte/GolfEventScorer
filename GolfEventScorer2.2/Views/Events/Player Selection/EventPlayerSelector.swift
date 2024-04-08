//
//  EventPlayerSelection.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/14/24.
//

import SwiftUI

struct EventPlayerSelector: View {
    @EnvironmentObject var gES: GolfEventScorer
    @Environment(\.dismiss) private var dismiss
    var event: Event
    
    var body: some View {
        VStack {
            Text("Event Players Edit")
            Text("")
            Text("Sort Players by Name, HI, Team")
            Text("")
            HStack {
                Text("Players Included")
                Text("Players Available")
            }
            GeometryReader { geometry in
                HStack{
                    if event.players.count > 0 {
                        ScrollView {
                            ForEach(event.players) { player in
                                Button {
                                    gES.removePlayerFromEvent(event: event, player: player)
                                } label: {
                                    PlayerSummary(player: player)
                                }
                            }
                        }.frame(width: geometry.size.width * 0.5)
                    }
                    
                    if event.playersAvailable.count > 0 {
                        ScrollView {
                            ForEach(event.playersAvailable) { player in
                                
                                Button {
                                    gES.addPlayerToEvent(event: event, player: player)
                                } label: {
                                    PlayerSummary(player: player)
                                }
                            }
                        }
                        .frame(width: geometry.size.width * 0.5)
                    }
                }
                    
                
            }
            
        }
        .onAppear { initPlayersForEvent() }
        
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
        }
        //                ToolbarItem(placement: .navigationBarTrailing) {
        //                    Button {
        //                        if teeCopy.siInputOK {
        //                            print("siInput is OK")
        //                        }
        //                        else {
        //                            print("siInput is NOT OK")
        //                        }
        //                        if isNew {
        //                            gES.addCourseTee(course: course, tee: teeCopy)
        //                            dismiss()
        //                        } else {
        //                            gES.modifyCourseTee(course: course, tee: teeCopy)
        //                            dismiss()
        //                        }
        //                    } label: {
        //                        Text("Save")
        //                    }
    }
    
    
        func initPlayersForEvent() {
            gES.preparePlayerListsForEvent(event)
        }
}

//#Preview {
//    EventPlayerSelection()
//}

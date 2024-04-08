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
    @State private var copyOfPlayersInEvent = [Player]()
    @State private var playersNotInEvent = [Player]()
    
    var body: some View {
        VStack {
            Text(event.name).font(.pageTitleFont)
            Text("")
            Text("Sort Players by Name, HI, Team")
            Text("")
            
            GeometryReader { geometry in
                HStack{
                    VStack {
                        Text("Included Players")
                        ScrollView {
                            ForEach(copyOfPlayersInEvent) { player in
                                Button {
                                    playersNotInEvent.append(player)
                                    copyOfPlayersInEvent.removeAll(where: { $0.id == player.id })
                                } label: {
                                    PlayerSummary(player: player)
                                }
                            }
                        }
                    }
                    .padding(5)
                    .frame(width: geometry.size.width * 0.5)
                    VStack {
                        Text("Available Players")
                        ScrollView {
                            ForEach(playersNotInEvent) { player in
                                
                                Button {
                                    copyOfPlayersInEvent.append(player)
                                    playersNotInEvent.removeAll(where: { $0.id == player.id })
                                } label: {
                                    PlayerSummary(player: player)
                                }
                            }
                            
                        }
                    }
                    
                    .padding(.trailing, 15)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    .frame(width: geometry.size.width * 0.5)
                    
                }
            }
        }
        .onAppear { initPlayersForEvent() }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
//                    gES.modifyPlayersInEvent(event: event, newPlayerList: copyOfPlayersInEvent)
                    gES.modifyPlayersInScorecardGrid(event, newPlayerList: copyOfPlayersInEvent)
//                    gES.modifyPlayersInScorecardGrid(event: event, newPlayerList: copyOfPlayersInEvent)
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
    
    func initPlayersForEvent() {
        copyOfPlayersInEvent = event.playersInEvent
        for player in gES.players {
            if !copyOfPlayersInEvent.contains(where: { $0.id == player.id }) {
                playersNotInEvent.append(player)
            }
        }
    }
}

//#Preview {
//    EventPlayerSelection()
//}

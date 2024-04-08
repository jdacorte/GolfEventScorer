//
//  PlayerList.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/18/24.
//

import SwiftUI

struct PlayerList: View {
    @EnvironmentObject var gES: GolfEventScorer
    @State private var isEdittingPlayer = false
    @State private var isAddingPlayer = false
    @State private var playerCopy = Player()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Players").font(.pageTitleFont)
                ScrollView {
                    ForEach(gES.players) { player in
                        Button {
                            playerCopy = player
                            isEdittingPlayer = true
                        } label: {
                            PlayerSummary(player: player)
                        }
//                        NavigationLink {
//                            PlayerDetail(player: player)
//                        } label: {
//                            PlayerSummary(player: player)
//                        }
                    }
                }
            }
            .padding()
            .toolbar {
                Button {
                    isAddingPlayer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isAddingPlayer) {
            NavigationView {
                PlayerEditor(player: $playerCopy, isNew: true)
            }
        }
        .sheet(isPresented: $isEdittingPlayer) {
            NavigationView {
                PlayerEditor(player: $playerCopy, isNew: false)
            }
        }
    }
}

#Preview {
    PlayerList()
}

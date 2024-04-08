//
//  PlayerDetail.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

//struct PlayerDetail: View {
//    @EnvironmentObject var gES: GolfEventScorer
//    @Environment(\.dismiss) private var dismiss
//    var player: Player
//    
//    var body: some View {
//        VStack {
//            Text(player.name)
//                .font(.pageTitleFont)
//            Text("\(String(describing: player.hi))")
//            Text(player.teeChoice)
//        }
//        .toolbar {
//            ToolbarItem(placement: .principal) {
//                Button {
//                    gES.deletePlayer(player)
//                    dismiss()
//                } label: {
//                    Label("", systemImage: "trash")
//                        .foregroundColor(.red)
//                }
//            }
//            ToolbarItem(placement: .navigationBarTrailing) {
//                NavigationLink {
//                    PlayerEditor(player: player, isNew: false)
//                } label: {
//                    Label("", systemImage: "pencil")
//                        .foregroundColor(.blue)
//                }
//            }
//        }
//        .navigationBarTitleDisplayMode(.inline)
//        .padding()
//    }
//}

//    #Preview {
//        PlayerDetail(player: PlayerData())
//    }

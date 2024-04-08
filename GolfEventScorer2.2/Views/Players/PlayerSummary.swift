//
//  PlayerInfo.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct PlayerSummary: View {
    var player: PlayerData
    var body: some View {
        Text("PlayerInfo")
    }
}

#Preview {
    PlayerSummary(player: PlayerData())
}

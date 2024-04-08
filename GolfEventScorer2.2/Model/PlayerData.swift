//
//  PlayerData.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/8/24.
//

import SwiftUI

extension GolfEventScorer {
    func deletePlayer(_ player: Player) {
        players.removeAll { $0.id == player.id }
    }

    func addPlayer(_ player: Player) {
        players.append(player)
    }

    func modifyPlayer(_ player: Player) {
        if let index = players.firstIndex(where: { $0.id == player.id }) {
            players[index] = player
        }
    }
}

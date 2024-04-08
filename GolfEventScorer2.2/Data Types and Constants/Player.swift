//
//  PlayerData.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct Player: Identifiable, Hashable {
    var id = UUID()
    var name = ""
    var hi: Double? = nil
    var teeChoice = "Select Tee"
}

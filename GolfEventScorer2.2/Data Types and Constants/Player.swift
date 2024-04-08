//
//  PlayerData.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

// I think that id should be "let" but it produced an error at some time-it does not need to be @published, do the others?
struct Player: Identifiable {
    var id = UUID()
    var name = ""
    var hi : Double = 0
    var teeChoice = ""
    
//    func copy() -> PlayerData {
//        let new = PlayerData()
//        new.id = id
//        new.name = name
//        new.hi = hi
//        new.team = team
//        return new
//    }
}

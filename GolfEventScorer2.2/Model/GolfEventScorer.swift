//
//  GolfEventScorer.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

@Observable final class GolfEventScorer {
    var players = [PlayerData]()
    var courses = [CourseData]()
    var events = [EventData]()
//    var games = [GameData]()
    
    var selectedEventIndex: Int = 0
    var scorecardOffset = 0
    
    var gameOptions = ["< Select Game >", "Stroke", "Match", "Stableford", "Nassau"]
}

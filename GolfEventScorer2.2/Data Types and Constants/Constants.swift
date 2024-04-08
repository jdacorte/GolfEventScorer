//
//  Constants.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct K {
    struct Item {
        static let cornerRadius:CGFloat = 10
        static let lineWidth:CGFloat = 3
    }
    struct Scorecard {
        static let scoresDisplayed = 6
        static let boxHeight:CGFloat = 40
        static let boxWidth:CGFloat = 40
        static let rowHeaderWidth:CGFloat = 100
        static let rowHeaderPadding:CGFloat = 10
        static let gridSpacing:CGFloat = 2
    }
    
    struct Course {
        static let noCourseSelected = "< Select Course >"
        // courses are temp until course input working
        static let courseOptions = ["Select Course", "Kebo", "Causeway", "Northeast", "Pebble Beach"]
    }
    
    struct Games {
        static let gameOptions = ["Select Game", "Stroke", "Match", "Stableford", "Nassau"]
      
    }
    
    struct Tees {
        static let teeOptions = ["Select Tee", "Black", "Blue", "White", "Red", "Yellow", "Green", "Gold", "Silver", "Other"]
      
        static let holeNumbers = ["X", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]
    }
}



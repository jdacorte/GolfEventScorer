//
//  Constants.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct K {
    struct General {
        static let itemCornerRadius: CGFloat = 10
        static let itemLineWidth: CGFloat = 3
    }
    struct Scorecard {
        static let scoresDisplayed = 6
        static let boxHeight: CGFloat = 40
        static let boxWidth: CGFloat = 40
        static let rowHeaderWidth: CGFloat = 100
        static let rowHeaderPadding: CGFloat = 10
        static let gridSpacing: CGFloat = 2
        static let eventStartCaution = "Games (type, course, holes played) can not be changed once an event is started. Wagers, however, can be changed. Players can be added or removed once the event has started."
    }
    
    struct Course {
        // courses are temp until course input working
        static let courseOptions = ["Select Course", "Kebo", "Causeway", "Northeast", "Pebble Beach"]
    }
    
    struct Games {
        static let gameOptions = ["Select Gamex", "Stroke", "Match", "Stableford", "Nassau"]
        static let incompleteGameInfo = "Check to make sure your game is complete.  A game needs a type, a course, and at least one hole selected to play."
      
    }
    
    struct Tees {
        static let teeOptions = ["Select Tee", "Black", "Blue", "White", "Red", "Yellow", "Orange", "Green", "Gold", "Silver", "Other"]
        static let holeNumbers = ["X", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"]
    }
}



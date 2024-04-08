//
//  Formatter.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 4/4/24.
//

import SwiftUI

extension Formatter {
    static let scoreFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol  = ""     // Show empty string instead of zero
        return formatter
    }()
}

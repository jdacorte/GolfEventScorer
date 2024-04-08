//
//  ScorecardInputBox.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/24/24.
//

import SwiftUI

struct ScorecardGridBox: View {
    @EnvironmentObject var gES: GolfEventScorer
    var event: Event
    var playerIndex: Int
    var entryIndex: Int
    @Binding var value: Int
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: K.General.itemCornerRadius)
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: K.General.itemLineWidth).frame(width: K.Scorecard.boxWidth, height: K.Scorecard.boxHeight)
            TextField("",value: $value, formatter: Formatter.scoreFormat)
                .padding(1)
                .multilineTextAlignment(.center)
                .onChange(of: value) {
                    gES.modifyEventScorecardEntry(event: event, playerIndex: playerIndex, entryIndex: entryIndex, value: value)
                }
                .foregroundColor(.black)
        }
        .foregroundColor(.blue)
    }
}


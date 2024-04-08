//
//  ScorecardInput.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/23/24.
//

import SwiftUI

struct ScorecardGrid: View {
    @EnvironmentObject var gES: GolfEventScorer
    @Environment(\.dismiss) private var dismiss
    var event: Event
    @Binding var offset: Int
    @Binding var scorecardCopy: [[ScorecardResultData]]
    @State private var entryIndex: Int = 0
    //    @Binding scorecardCopy = [[ScorecardResultData]](repeating: [ScorecardResultData](repeating: ScorecardResultData(), count: 6), count: 100)
    var body: some View {
        ScrollView {
        Grid(horizontalSpacing: K.Scorecard.gridSpacing,verticalSpacing: K.Scorecard.gridSpacing) {
            
                ForEach(Array(event.playersInEvent.enumerated()), id: \.element) { playerIndex, player in
                    
                    GridRow {
                        Text(player.name).frame(width: K.Scorecard.rowHeaderWidth).padding(10)
                        ForEach(0..<K.Scorecard.scoresDisplayed, id: \.self) { entry in
                            ScorecardGridBox(event: event, playerIndex: playerIndex, entryIndex: entry + offset, value: $scorecardCopy[playerIndex][entry + offset].rawScore)
                        }
                    }
                    .frame(height: K.Scorecard.boxHeight)
                    
                }
            }
        }
    }
}

//#Preview {
//    ScorecardInput()
//}

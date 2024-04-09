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
    var scorecardDataType: String
    @State private var entryIndex: Int = 0

    var body: some View {
        ScrollView {
        Grid(horizontalSpacing: K.Scorecard.gridSpacing,verticalSpacing: K.Scorecard.gridSpacing) {
            
                ForEach(Array(event.playersInEvent.enumerated()), id: \.element) { playerIndex, player in
                    
                    GridRow {
                        Text(player.name).frame(width: K.Scorecard.rowHeaderWidth).padding(10)
                        ForEach(0..<K.Scorecard.scoresDisplayed, id: \.self) { entry in
                            if scorecardDataType == "Score" {
                                ScorecardGridBox(event: event, playerIndex: playerIndex, entryIndex: entry + offset, value: $scorecardCopy[playerIndex][entry + offset].rawScore)
                            } else if scorecardDataType == "Strokes" {
                                ScorecardGridBox(event: event, playerIndex: playerIndex, entryIndex: entry + offset, value: $scorecardCopy[playerIndex][entry + offset].strokes)
                            } 
//                            else if scorecardDataType == "Score with HCP" {
//                                ScorecardGridBox(event: event, playerIndex: playerIndex, entryIndex: entry + offset, value: $scorecardCopy[playerIndex][entry + offset].hCPScore)
//                            } 
                            else if scorecardDataType == "Par" {
                                ScorecardGridBox(event: event, playerIndex: playerIndex, entryIndex: entry + offset, value: $scorecardCopy[playerIndex][entry + offset].par)
                            } else if scorecardDataType == "Stroke Index" {
                                ScorecardGridBox(event: event, playerIndex: playerIndex, entryIndex: entry + offset, value: $scorecardCopy[playerIndex][entry + offset].strokeIndex)
                            }
                           
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

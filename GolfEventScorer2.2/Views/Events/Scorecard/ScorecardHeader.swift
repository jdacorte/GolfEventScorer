//
//  ScorecardHeader.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/23/24.
//

import SwiftUI

struct ScorecardHeader: View {
    var event: Event
    @Binding var offset: Int
    
    var body: some View {
        Grid(horizontalSpacing: K.Scorecard.gridSpacing,verticalSpacing: K.Scorecard.gridSpacing) {
            // fix this so that it is player in
            
            GridRow {
                Text("Game").frame(width: K.Scorecard.rowHeaderWidth).padding(10)
                //                        ForEach(0..<K.Scorecard.scoresDisplayed, id: \.self) { score in
                ForEach(0..<K.Scorecard.scoresDisplayed, id: \.self) { entry in
                    ScorecardHeaderBox(value: event.scorecardHeader[entry + offset].gameSymbol)
                }
            }.frame(height: K.Scorecard.boxHeight)
            
            GridRow {
                Text("Course").frame(width: K.Scorecard.rowHeaderWidth).padding(10)
                //                        ForEach(0..<K.Scorecard.scoresDisplayed, id: \.self) { score in
                ForEach(0..<K.Scorecard.scoresDisplayed, id: \.self) { entry in
                    ScorecardHeaderBox(value: event.scorecardHeader[entry + offset].courseSymbol)
                }
            }.frame(height: K.Scorecard.boxHeight)
            
            GridRow {
                Text("Hole").frame(width: K.Scorecard.rowHeaderWidth).padding(10)
                //                        ForEach(0..<K.Scorecard.scoresDisplayed, id: \.self) { score in
                ForEach(0..<K.Scorecard.scoresDisplayed, id: \.self) { entry in
                    ScorecardHeaderBox(value: "\(event.scorecardHeader[entry + offset].hole)")
                }
            }.frame(height: K.Scorecard.boxHeight)
            
        }
        
    }
}

//#Preview {
//    ScorecardHeader()
//}

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
//    @Binding scorecardCopy = [[ScorecardResultData]](repeating: [ScorecardResultData](repeating: ScorecardResultData(), count: 6), count: 100)
    var body: some View {
        Grid(horizontalSpacing: K.Scorecard.gridSpacing,verticalSpacing: K.Scorecard.gridSpacing) {
            ForEach(Array(event.playersInEvent.enumerated()), id: \.element) { playerIndex, player in
                GridRow {
                    Text(player.name).frame(width: K.Scorecard.rowHeaderWidth).padding(10)
                    ForEach(0..<K.Scorecard.scoresDisplayed, id: \.self) { entry in
                        ZStack {
                            let shape = RoundedRectangle(cornerRadius: K.General.itemCornerRadius)
                            shape.fill().foregroundColor(.white)
                            shape.strokeBorder(lineWidth: K.General.itemLineWidth).frame(width: K.Scorecard.boxWidth, height: K.Scorecard.boxHeight)
                            TextField("",value: $scorecardCopy[playerIndex][entry + offset].rawScore,format: .number)
                                .padding(1)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                        }
                    }
                }
                .frame(height: K.Scorecard.boxHeight)
                
            }
//            .onAppear {
//                scorecardCopy = event.scorecard
//            }
            
            
            // PUT A DISMISS INSTEAD OF THE NAVIGATION VIEW BACK BUTTON-SEE IF THAT WORKS
        }
        
    }
}

//#Preview {
//    ScorecardInput()
//}

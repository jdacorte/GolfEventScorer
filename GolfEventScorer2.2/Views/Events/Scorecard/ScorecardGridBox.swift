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
    @State private var score = 0
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: K.General.itemCornerRadius)
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: K.General.itemLineWidth).frame(width: K.Scorecard.boxWidth, height: K.Scorecard.boxHeight)
            TextField("",value: $value,format: .number)
                .padding(1)
                .multilineTextAlignment(.center)
                .onChange(of: value) {
                    print("value is \(value) for player \(playerIndex) and entry \(entryIndex)")
                    gES.modifyEventScorecardEntry(event: event, playerIndex: playerIndex, entryIndex: entryIndex, value: value)
                }
                .foregroundColor(.black)
        }
        .onAppear(perform: initScore)
        .foregroundColor(.blue)
    }
    func initScore() {
        
        
//        print("init entry \(entry)")
        //        let playerIndex = golfEventScorer.findPlayerIndex(playerID: playerID)
//        score = value
//        print("     score is \(score)")
        //        golfEventScorer.events[golfEventScorer.selectedEventIndex].scorecardAllPlayers[golfEventScorer.findPlayerIndex(playerID: playerID)][entry].rawScore
    }
}


//#Preview {
//    ScorecardInputBox()
//}

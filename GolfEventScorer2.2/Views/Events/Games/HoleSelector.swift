//
//  HoleSelector.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/15/24.
//

import SwiftUI

struct HoleSelector: View {
    @Binding var game: Game
    var holeNum: Int
    var enableSelection: Bool
    
    var body: some View {
        Button {
            if enableSelection {
                game.holesToPlay[holeNum].toggle()
            } 
            
        } label: {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 5)
                if game.holesToPlay[holeNum] {
                    shape.fill().foregroundColor(.green)
                } else {
                    shape.fill().foregroundColor(.red)
                }
                Text("\(holeNum)").foregroundColor(.black)
            }
        }
    }
}

//#Preview {
//    HoleSelector()
//}

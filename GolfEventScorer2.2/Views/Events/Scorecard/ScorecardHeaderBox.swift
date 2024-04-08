//
//  ScorecardHeaderBox.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/23/24.
//

import SwiftUI

struct ScorecardHeaderBox: View {
    var value: String
    var body: some View {
        ZStack {
           
            let shape = RoundedRectangle(cornerRadius: K.General.itemCornerRadius)
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: K.General.itemLineWidth).frame(width: 40, height: K.Scorecard.boxHeight)
           
            Text(value)
            .foregroundColor(.black)
//            .padding()
            
            
        }

        .foregroundColor(.green)
    }
}

//#Preview {
//    ScorecardHeaderBox()
//}

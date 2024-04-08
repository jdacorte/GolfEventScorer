//
//  GameSummary.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct GameSummary: View {
    var game: Game
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: K.General.itemCornerRadius)
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: K.General.itemLineWidth)
            VStack (alignment: .leading){
                Text(game.type)
                    .font(.headline).frame(maxWidth: .infinity, alignment: .leading)
                Text(game.course)
                    .font(.subheadline).frame(maxWidth: .infinity, alignment: .leading)
                Text("\(game.totalGameHoles) Holes")
                    .font(.subheadline).frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundColor(.black)
            .padding()
        }
        .foregroundColor(.purple)
    }
}

#Preview {
    GameSummary(game: Game())
}

//
//  PlayerInfo.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct PlayerSummary: View {
    var player: Player
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: K.General.itemCornerRadius)

            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: K.General.itemLineWidth)

            VStack (alignment: .leading){
                Text(player.name)
                    .font(.itemHeadingFont).frame(maxWidth: .infinity, alignment: .leading)
//                Text("\(player.hi)")
//                HStack {
                Text("   HI: " + String(format: "%.1f", player.hi ?? 0.0))
                        .font(.itemDetail).frame(maxWidth: .infinity, alignment: .leading)
                    Text("   Tees: " + player.teeChoice)
                        .font(.itemDetail).frame(maxWidth: .infinity, alignment: .leading)
//                }
            }
            .foregroundColor(.black)
            .padding(10)
        }
        .foregroundColor(.green)
    }
}

#Preview {
    PlayerSummary(player: Player())
}

//
//  TeeInfo.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct TeeSummary: View {
    var tee: Tee
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: K.General.itemCornerRadius)
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: K.General.itemLineWidth)
            VStack (alignment: .leading){
                Text("\(tee.color)")
                    .font(.headline).frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    VStack {
                        Text("Rating")
                        Text(String(format: "%.1f", tee.rating ?? 0.0))
                            .font(.subheadline).frame(maxWidth: .infinity, alignment: .center)
                    }
                    VStack {
                        Text("Slope")
                        Text("\(tee.slope ?? 0)")
                            .font(.subheadline).frame(maxWidth: .infinity, alignment: .center)
                    }
                    VStack {
                        Text("Par")
                        Text("\(tee.parTotal ?? 0)")
                            .font(.subheadline).frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }
            .foregroundColor(.black)
            .padding()
        }
        .foregroundColor(.green)
    }
}

#Preview {
    TeeSummary(tee: Tee())
}

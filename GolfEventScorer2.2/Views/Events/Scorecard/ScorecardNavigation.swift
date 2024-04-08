//
//  ScorecardNavigation.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/23/24.
//

import SwiftUI

struct ScorecardNavigation: View {
    @EnvironmentObject var gES: GolfEventScorer
    var numberOfHoles: Int
    @Binding var offset: Int
    @State private var maxOffset = 0
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: K.General.itemCornerRadius)
            shape.fill().foregroundColor(.gray)
                .frame(height: 80)
//            shape.strokeBorder(lineWidth: K.General.itemLineWidth)
//            VStack (alignment: .leading){
//                Text(course.name)
//                    .font(.title3).frame(maxWidth: .infinity, alignment: .leading)
//                Text(course.location)
//                    .font(.subheadline).frame(maxWidth: .infinity, alignment: .leading)
//            }
            HStack {
                Text("").frame(width: K.Scorecard.rowHeaderWidth).padding(10)
                Button {
                    offset = 0
                } label: {
                    Image(systemName: "backward.end.fill").foregroundColor(.black)
                }
                Button {
                    offset -= (K.Scorecard.scoresDisplayed - 1)
                    if offset < 0 {
                        offset = 0
                    }
                } label: {
                    Image(systemName: "backward.fill").foregroundColor(.black)
                }
                Button {
                    offset -= 1
                    if offset < 0 {
                        offset = 0
                    }
                } label: {
                    Image(systemName: "arrowtriangle.backward.fill").foregroundColor(.black)
                }
                Button {
                    offset += 1
                    if offset > maxOffset {
                        offset = maxOffset
                    }
                } label: {
                    Image(systemName: "arrowtriangle.forward.fill").foregroundColor(.black)
                }
                Button {
                    offset += (K.Scorecard.scoresDisplayed - 1)
                    if offset > maxOffset {
                        offset = maxOffset
                    }
                } label: {
                    Image(systemName: "forward.fill").foregroundColor(.black)
                }
                Button {
                    offset = maxOffset
                } label: {
                    Image(systemName: "forward.end.fill").foregroundColor(.black)
                }
            }
            .onAppear {
                maxOffset = numberOfHoles - K.Scorecard.scoresDisplayed
            }
            .font(.title)
            .padding(15)
            .foregroundColor(.black)
            .padding()
        }
        .foregroundColor(.green)
        
    }
}

//#Preview {
//    ScorecardNavigation()
//}

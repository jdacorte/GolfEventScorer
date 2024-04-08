//
//  EventInfo.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct EventSummary: View {
    var event: Event
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: K.General.itemCornerRadius)
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: K.General.itemLineWidth)
            VStack (alignment: .leading){
                Text(event.name)
                    .font(.title3).frame(maxWidth: .infinity, alignment: .leading)
                Text(event.date, format: .dateTime.day().month().year())
                    .font(.subheadline).frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundColor(.black)
            .padding()
        }
        .foregroundColor(.purple)
    }
}

#Preview {
    EventSummary(event: Event())
}

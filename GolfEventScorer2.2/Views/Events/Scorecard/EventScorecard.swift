//
//  EventScorecard.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/14/24.
//

import SwiftUI

struct EventScorecard: View {
    @EnvironmentObject var gES: GolfEventScorer
    @Environment(\.dismiss) private var dismiss
    var event: Event
    @State private var scorecardCopy = [[ScorecardResultData]](repeating: [ScorecardResultData](repeating: ScorecardResultData(), count: 6), count: 100)
    
    // offset should be saved in event so it remebers where it was
    @State private var offset: Int = 0
    var body: some View {
        VStack {
            Text(event.name + " Scorecard").font(.pageTitleFont)
            ScorecardHeader(event: event, offset: $offset)
            ScorecardGrid(event: event, offset: $offset, scorecardCopy: $scorecardCopy)
            Spacer()
//            ScorecardPicker()
            ScorecardNavigation(numberOfHoles: event.totalEventHoles, offset: $offset)
            
        }
        .onAppear {
            gES.setEventStarted(event)
            scorecardCopy = event.scorecardGrid
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
//                    gES.saveEventScorecard(event: event, scorecard: scorecardCopy)
                    dismiss()
                    
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Event Details")
                    }
                    
                }
            }
        }
        if event.playersInEvent.count == 0 {
            Text("No Players in Event")
        }
        if event.games.count == 0 {
            Text("No Games in Event")
        }
    }
    
}

//#Preview {
//    EventScorecard()
//}

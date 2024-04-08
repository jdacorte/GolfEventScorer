//
//  EventInfo.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct EventSummary: View {
    var event: EventData
    var body: some View {
        Text("Event Info")
    }
}

#Preview {
    EventSummary(event: EventData())
}

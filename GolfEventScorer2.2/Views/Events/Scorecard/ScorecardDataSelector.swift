//
//  ScorecardDataSelector.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 4/8/24.
//

import SwiftUI

struct ScorecardDataSelector: View {
    @Binding var scorecardDataType: String
    @State private var dataTypes = ["Score", "Strokes", "Score with HCP", "Par", "SI"]
    var body: some View {
        VStack {
            Form {
                Section {
                    Picker("Display:", selection: $scorecardDataType) {
                        ForEach(dataTypes, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
        }
    }
}


//#Preview {
//    ScorecardDataSelector()
//}

//
//  HoleYardageEditor.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/16/24.
//

import SwiftUI

struct HoleYardageEditor: View {
    @Binding var tee: Tee
    var hole: Int

    var body: some View {
        VStack {
            TextField( "Yards",value: $tee.holes[hole].yards,format: .number)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
        }
    }
}

//#Preview {
//    HoleYardageEditor()
//}

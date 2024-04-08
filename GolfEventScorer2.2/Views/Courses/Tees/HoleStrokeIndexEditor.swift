//
//  HoleStrokeIndexEditor.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/17/24.
//

import SwiftUI

struct HoleStrokeIndexEditor: View {
    @Binding var tee: Tee
    var hole: Int
    var availableSI = [Int]()

    var body: some View {
            TextField( "SI",value: $tee.holes[hole].strokeIndex,format: .number)
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.center)
    }
}

//#Preview {
//    HoleStrokeIndexEditor()
//}

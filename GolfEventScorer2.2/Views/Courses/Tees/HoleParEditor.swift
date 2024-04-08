//
//  HoleParEditor.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/17/24.
//

import SwiftUI

struct HoleParEditor: View {
    @Binding var tee: Tee
    var hole: Int
 
    var body: some View {
        VStack {
            TextField( "Par",value: $tee.holes[hole].par,format: .number)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
        }
    }
}

//#Preview {
//    HoleParEditor()
//}

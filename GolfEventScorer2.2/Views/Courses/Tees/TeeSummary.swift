//
//  TeeInfo.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct TeeSummary: View {
    var tee: TeeData
    var body: some View {
        Text("Tee Info")
    }
}

#Preview {
    TeeSummary(tee: TeeData())
}

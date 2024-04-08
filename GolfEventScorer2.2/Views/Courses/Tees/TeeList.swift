//
//  Tees.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct TeeList: View {
    @Environment(GolfEventScorer.self) private var gES
    var course: Course
    var body: some View {
        NavigationView {
            VStack {
                Text("Tees").font(.title)
                ScrollView {
                    ForEach(course.tees) { tee in
                        NavigationLink {
                            TeeDetail(tee: tee)
                        } label: {
                            TeeSummary(tee: tee)
                        }
                    }
                }
            }
            .padding()
            .toolbar {
                NavigationLink {
                    TeeDetail(tee: Tee())
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    TeeList(course: Course())
}

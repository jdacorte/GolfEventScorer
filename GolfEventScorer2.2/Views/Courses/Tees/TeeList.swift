//
//  Tees.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct TeeList: View {
    var course: Course
    @State private var isAddingNewTee = false
    @State private var isEditingTee = false
    @State private var selectedTee = Tee()
    @State private var teeIndex = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    isAddingNewTee = true
                } label: {
                    Image(systemName: "plus")
                }.frame(maxWidth: .infinity, alignment: .trailing)
                Text("Tees")
                    .font(.title3)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                ScrollView {
                    ForEach(Array(course.tees.enumerated()), id: \.element) { index, tee in
                        Button {
                            teeIndex = index
                            isEditingTee = true
                        }
                    label: {
                        TeeSummary(tee: tee)
                    }
                    }
                }
                .frame(maxWidth:.infinity)
            }
            .padding()
            .sheet(isPresented: $isAddingNewTee) {
                // should this not be a navigation view
                NavigationView {
                    TeeEditor(course: course, teeIndex: $teeIndex, isNew: true)
                }
            }
            .background(Color(.systemGray2))
            .cornerRadius(10)
            .sheet(isPresented: $isEditingTee) {
                NavigationView {
                    TeeEditor(course: course, teeIndex: $teeIndex, isNew: false)
                }
            }
        }
    }
}

#Preview {
    TeeList(course: Course())
}

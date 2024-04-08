//
//  TeeEditor.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/16/24.
//

import SwiftUI

struct TeeEditor: View {
    @EnvironmentObject var gES: GolfEventScorer
    @Environment(\.dismiss) private var dismiss
    var course: Course
    @Binding var teeIndex: Int
    var isNew: Bool
    @State private var teeCopy = Tee()
    let holeSpecColumns = Array(repeating: GridItem(.flexible(minimum: 30)), count: 4)
    
    var body: some View {
        VStack {
            Text(course.name).font(.pageTitleFont)
            Text(course.location)
            Menu {
                Picker(selection: $teeCopy.color) {
                    ForEach(K.Tees.teeOptions, id: \.self) {
                        Text("\($0)")
                    }
                    .font(.title3)
                } label: {}
            } label: {
                Text(teeCopy.color)
                    .font(.title3)
            }.id(teeCopy.color)
            Grid() {
                GridRow {
                    Text("Rating")
                    Text("Slope")
                    Text("Par Total")
                }
                GridRow {
                    TextField("Rating", value: $teeCopy.rating, format: .number, prompt: Text("Rating"))
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                    TextField("Slope", value: $teeCopy.slope, format: .number, prompt: Text("Slope"))
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                    TextField("Par Total", value: $teeCopy.parTotal, format: .number, prompt: Text("Par Total"))
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.center)
                }
                
            }
            .padding(20)
            ScrollView(){
                LazyVGrid(columns: holeSpecColumns) {
                    Text("Hole")
                    Text("Yards")
                    Text("Par")
                    Text("SI")
                    ForEach(1..<19, id: \.self) { holeNum in
                        Text(K.Tees.holeNumbers[holeNum]).font(.title)
                        HoleYardageEditor(tee: $teeCopy, hole: holeNum)
                        HoleParEditor(tee: $teeCopy, hole: holeNum)
                        HoleStrokeIndexEditor(tee: $teeCopy, hole: holeNum)
                    }
                }
            }
            Spacer()
        }
        .onAppear {
            if !isNew {
                teeCopy = course.tees[teeIndex] // Grab a copy in case we decide to make edits.
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
            ToolbarItem(placement: .principal) {
                Button {
                    if !isNew {
                        gES.deleteCourseTee(course: course, tee: course.tees[teeIndex])
                    }
                    dismiss()
                } label: {
                    if isNew {
                        Text("")
                    } else {
                        Label("", systemImage: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                if !isNew {
                    Button {
                        gES.copyCourseTee(course: course, tee: teeCopy)
                        dismiss()
                    } label: {
                        Label("", systemImage: "doc.on.doc")
                            .foregroundColor(.blue)
                    }
                }
                
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if teeCopy.strokeIndexInputOK {
                        print("siInput is OK")
                    }
                    else {
                        print("siInput is NOT OK")
                    }
                    if isNew {
                        gES.addCourseTee(course: course, tee: teeCopy)
                        dismiss()
                    } else {
                        gES.modifyCourseTee(course: course, tee: teeCopy)
                        dismiss()
                    }
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

//#Preview {
//    TeeEditor()
//}

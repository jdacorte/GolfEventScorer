//
//  CourseEditor.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/16/24.
//

import SwiftUI

struct CourseEditor: View {
    @EnvironmentObject var gES: GolfEventScorer
    @Environment(\.dismiss) private var dismiss
    var course: Course
    var isNew: Bool
    @State private var courseCopy = Course()

    var body: some View {
        VStack {
            TextField("Course Name", text: $courseCopy.name)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
            TextField("Course Location", text: $courseCopy.location)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
            
            Spacer()
        }
        .onAppear {
            courseCopy = course // Grab a copy in case we decide to make edits.
        }
        .toolbar {
            ToolbarItem {
                Button {
                    if isNew {
                        gES.addCourse(courseCopy)
                        dismiss()
                    } else {
                        gES.modifyCourse(courseCopy)
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
//    CourseEditor()
//}

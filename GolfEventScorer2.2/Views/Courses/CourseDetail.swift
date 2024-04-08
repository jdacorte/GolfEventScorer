//
//  CourseDetail.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct CourseDetail: View {
    @EnvironmentObject var gES: GolfEventScorer
    @Environment(\.dismiss) private var dismiss
    var course: Course
    
    var body: some View {
        VStack {
            Text(course.name)
                .font(.pageTitleFont)
            Text(course.location)
            TeeList(course: course)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Button {
                    gES.deleteCourse(course)
                    dismiss()
                } label: {
                    Label("", systemImage: "trash")
                        .foregroundColor(.red)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    CourseEditor(course: course, isNew: false)
                } label: {
                    Label("", systemImage: "pencil")
                        .foregroundColor(.blue)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    CourseDetail(course: Course())
}

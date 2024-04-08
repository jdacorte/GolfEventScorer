//
//  CourseList.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/16/24.
//

import SwiftUI

struct CourseList: View {
    @EnvironmentObject var gES: GolfEventScorer
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Courses").font(.pageTitleFont)
                ScrollView {
                    ForEach(gES.courses) { course in
                        NavigationLink {
                            CourseDetail(course: course)
                        } label: {
                            CourseSummary(course: course)
                        }
                    }
                }
            }
            .padding()
            .toolbar {
                NavigationLink {
                    CourseEditor(course: Course(), isNew: true)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    CourseList()
}

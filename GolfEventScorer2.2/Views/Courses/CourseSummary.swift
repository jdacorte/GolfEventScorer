//
//  CourseInfo.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct CourseSummary: View {
    var course: CourseData
    var body: some View {
        Text("Course Info")
    }
}

#Preview {
    CourseSummary(course: CourseData())
}

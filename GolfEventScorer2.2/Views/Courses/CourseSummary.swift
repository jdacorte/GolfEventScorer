//
//  CourseInfo.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct CourseSummary: View {
    var course: Course
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: K.General.itemCornerRadius)
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: K.General.itemLineWidth)
            VStack (alignment: .leading){
                Text(course.name)
                    .font(.title3).frame(maxWidth: .infinity, alignment: .leading)
                Text(course.location)
                    .font(.subheadline).frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundColor(.black)
            .padding()
        }
        .foregroundColor(.green)
    }
}

#Preview {
    CourseSummary(course: Course())
}

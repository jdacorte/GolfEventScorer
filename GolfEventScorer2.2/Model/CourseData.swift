//
//  CourseData.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/16/24.
//

import SwiftUI

extension GolfEventScorer {
    func deleteCourse(_ course: Course) {
        courses.removeAll { $0.id == course.id }
    }

    func addCourse(_ course: Course) {
        courses.append(course)
    }

    func modifyCourse(_ course: Course) {
        if let index = courses.firstIndex(where: { $0.id == course.id }) {
            courses[index] = course
        }
    }
    
    func getCourseIndex(_ course: Course)->Int {
        return courses.firstIndex(where: {$0.id == course.id}) ?? 0
    }
    

}


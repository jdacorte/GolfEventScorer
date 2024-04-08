//
//  TeeData.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/16/24.
//

import SwiftUI

extension GolfEventScorer {
    
    func deleteCourseTee(course: Course, tee: Tee) {
        courses[getCourseIndex(course)].tees.removeAll { $0.id == tee.id }
    }
    
    func addCourseTee(course: Course, tee: Tee) {
//        print(getCourseIndex(course))
        courses[getCourseIndex(course)].tees.append(tee)
    }
    
    
    
    func getCourseTeeIndex(eventIndex: Int, _ tee: Game)->Int {
        return courses.firstIndex(where: {$0.id == tee.id}) ?? 0
    }
    
    func modifyCourseTee(course: Course, tee: Tee) {
        let courseIndex = courses.firstIndex(where: { $0.id == course.id }) ?? 0
        let teeIndex = courses[courseIndex].tees.firstIndex(where: { $0.id == tee.id }) ?? 0
        courses[courseIndex].tees[teeIndex] = tee
    }
    
    func copyCourseTee(course: Course, tee: Tee) {
        let courseIndex = getCourseIndex(course)
        courses[courseIndex].tees.append(tee)
        let lastTeeIndex = courses[courseIndex].tees.count - 1
        courses[courseIndex].tees[lastTeeIndex].id = UUID()
        courses[courseIndex].tees[lastTeeIndex].color = "Select Tee"
    }
    
    
}

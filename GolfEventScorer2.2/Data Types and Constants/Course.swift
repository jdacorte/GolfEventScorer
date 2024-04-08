//
//  CourseData.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var name = "New Course"
    var location = "Course Location"
    var tees = [Tee]()
}

struct Tee: Identifiable, Hashable {
    var id = UUID()
    var color = "Select Tee Color"
    var rating: Double? = nil
    var slope: Int? = nil
    var parTotal: Int? = nil
    var holes = Array(repeating: Hole(), count: 19)
    //  need this function to make Tee Equatable
    static func == (lhs: Tee, rhs: Tee) -> Bool {
        return 
            lhs.id == rhs.id &&
            lhs.color == rhs.color && 
            lhs.rating == rhs.rating &&
            lhs.slope == rhs.slope &&
            lhs.parTotal == rhs.parTotal &&
            lhs.holes[0] == rhs.holes[0] &&
            lhs.holes[1] == rhs.holes[1] &&
            lhs.holes[2] == rhs.holes[2] &&
            lhs.holes[3] == rhs.holes[3] &&
            lhs.holes[4] == rhs.holes[4] &&
            lhs.holes[5] == rhs.holes[5] &&
            lhs.holes[6] == rhs.holes[6] &&
            lhs.holes[7] == rhs.holes[7] &&
            lhs.holes[8] == rhs.holes[8] &&
            lhs.holes[9] == rhs.holes[9] &&
            lhs.holes[10] == rhs.holes[10] &&
            lhs.holes[11] == rhs.holes[11] &&
            lhs.holes[12] == rhs.holes[12] &&
            lhs.holes[13] == rhs.holes[13] &&
            lhs.holes[14] == rhs.holes[14] &&
            lhs.holes[15] == rhs.holes[15] &&
            lhs.holes[16] == rhs.holes[16] &&
            lhs.holes[17] == rhs.holes[17] &&
            lhs.holes[18] == rhs.holes[18]
    }
    //  need this function to make Tee Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Hole: Equatable {
    var yards: Int? = nil
    var par: Int? = nil
    var strokeIndex: Int? = nil
}

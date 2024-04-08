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
    var color = "Select Tee"
    var rating: Double? = nil
    var slope: Int? = nil
    var parTotal: Int? = nil
    var parTotalOK: Bool {
        var parCount = 0
        let parTotalTemp = parTotal ?? 0
        for i in 1...18 {
            parCount += holes[i].par ?? 0
        }
        if parCount == parTotalTemp {
            return true
        } else {
            return false
        }
    }
    var strokeIndexInputOK: Bool {
        var remainingSI = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]
        for i in 1...18 {
            let si = holes[i].strokeIndex ?? 0
            remainingSI[si] = 0
        }
        var remainingSICount = 0
        for i in 1...18 {
            remainingSICount += remainingSI[i]
        }
        if remainingSICount > 0 {
            return false
        } else {
            return true
        }
    }
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

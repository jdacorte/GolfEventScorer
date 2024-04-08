//
//  GolfEventScorer.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/1/24.
//

import SwiftUI

class GolfEventScorer: ObservableObject {
    @Published var players = [Player]()
    @Published var courses = [Course]()
    @Published var events = [Event]()
    
    init() {
        players.append(Player())
        players[0].name = "Jack DaCorte"
        players[0].teeChoice = "Blue"
        players[0].hi = 16.3
        players.append(Player())
        players[1].name = "Chris Schlief"
        players[1].teeChoice = "White"
        players[1].hi = 9.5
        players.append(Player())
        players[2].name = "Princess Callie"
        players[2].teeChoice = "Red"
        players[2].hi = 11.4
        
        courses.append(Course())
        courses[0].name = "Easy Course"
        courses[0].location = "Easy City"
        courses[0].tees.append(Tee())
        courses[0].tees[0].color = "Red"
        courses[0].tees[0].parTotal = 70
        courses[0].tees[0].slope = 120
        courses[0].tees[0].rating = 72.0
        courses[0].tees[0].holes[1].par = 3
        courses[0].tees[0].holes[1].strokeIndex = 1
        courses[0].tees[0].holes[2].par = 4
        courses[0].tees[0].holes[2].strokeIndex = 2
        courses[0].tees[0].holes[3].par = 5
        courses[0].tees[0].holes[3].strokeIndex = 3
        courses[0].tees[0].holes[4].par = 3
        courses[0].tees[0].holes[4].strokeIndex = 4
        courses[0].tees[0].holes[5].par = 4
        courses[0].tees[0].holes[5].strokeIndex = 5
        courses[0].tees[0].holes[6].par = 5
        courses[0].tees[0].holes[6].strokeIndex = 6
        courses[0].tees[0].holes[7].par = 3
        courses[0].tees[0].holes[7].strokeIndex = 7
        courses[0].tees[0].holes[8].par = 4
        courses[0].tees[0].holes[8].strokeIndex = 8
        courses[0].tees[0].holes[9].par = 5
        courses[0].tees[0].holes[9].strokeIndex = 9
        courses[0].tees[0].holes[10].par = 3
        courses[0].tees[0].holes[10].strokeIndex = 10
        courses[0].tees[0].holes[11].par = 4
        courses[0].tees[0].holes[11].strokeIndex = 11
        courses[0].tees[0].holes[12].par = 5
        courses[0].tees[0].holes[12].strokeIndex = 12
        courses[0].tees[0].holes[13].par = 3
        courses[0].tees[0].holes[13].strokeIndex = 13
        courses[0].tees[0].holes[14].par = 4
        courses[0].tees[0].holes[14].strokeIndex = 14
        courses[0].tees[0].holes[15].par = 5
        courses[0].tees[0].holes[15].strokeIndex = 15
        courses[0].tees[0].holes[16].par = 3
        courses[0].tees[0].holes[16].strokeIndex = 16
        courses[0].tees[0].holes[17].par = 4
        courses[0].tees[0].holes[17].strokeIndex = 17
        courses[0].tees[0].holes[18].par = 5
        courses[0].tees[0].holes[18].strokeIndex = 18
        courses[0].tees.append(Tee())
        courses[0].tees[1].color = "White"
        courses[0].tees[1].parTotal = 71
        courses[0].tees[1].slope = 121
        courses[0].tees[1].rating = 71.0
        courses[0].tees[1].holes[1].par = 3
        courses[0].tees[1].holes[1].strokeIndex = 1
        courses[0].tees[1].holes[2].par = 4
        courses[0].tees[1].holes[2].strokeIndex = 2
        courses[0].tees[1].holes[3].par = 5
        courses[0].tees[1].holes[3].strokeIndex = 3
        courses[0].tees[1].holes[4].par = 3
        courses[0].tees[1].holes[4].strokeIndex = 4
        courses[0].tees[1].holes[5].par = 4
        courses[0].tees[1].holes[5].strokeIndex = 5
        courses[0].tees[1].holes[6].par = 5
        courses[0].tees[1].holes[6].strokeIndex = 6
        courses[0].tees[1].holes[7].par = 3
        courses[0].tees[1].holes[7].strokeIndex = 7
        courses[0].tees[1].holes[8].par = 4
        courses[0].tees[1].holes[8].strokeIndex = 8
        courses[0].tees[1].holes[9].par = 5
        courses[0].tees[1].holes[9].strokeIndex = 9
        courses[0].tees[1].holes[10].par = 3
        courses[0].tees[1].holes[10].strokeIndex = 10
        courses[0].tees[1].holes[11].par = 4
        courses[0].tees[1].holes[11].strokeIndex = 11
        courses[0].tees[1].holes[12].par = 5
        courses[0].tees[1].holes[12].strokeIndex = 12
        courses[0].tees[1].holes[13].par = 3
        courses[0].tees[1].holes[13].strokeIndex = 13
        courses[0].tees[1].holes[14].par = 4
        courses[0].tees[1].holes[14].strokeIndex = 14
        courses[0].tees[1].holes[15].par = 5
        courses[0].tees[1].holes[15].strokeIndex = 15
        courses[0].tees[1].holes[16].par = 3
        courses[0].tees[1].holes[16].strokeIndex = 16
        courses[0].tees[1].holes[17].par = 4
        courses[0].tees[1].holes[17].strokeIndex = 17
        courses[0].tees[1].holes[18].par = 5
        courses[0].tees[1].holes[18].strokeIndex = 18
        courses[0].tees.append(Tee())
        courses[0].tees[2].color = "Blue"
        courses[0].tees[2].parTotal = 72
        courses[0].tees[2].slope = 122
        courses[0].tees[2].rating = 70.0
        courses[0].tees[2].holes[1].par = 3
        courses[0].tees[2].holes[1].strokeIndex = 1
        courses[0].tees[2].holes[2].par = 4
        courses[0].tees[2].holes[2].strokeIndex = 2
        courses[0].tees[2].holes[3].par = 5
        courses[0].tees[2].holes[3].strokeIndex = 3
        courses[0].tees[2].holes[4].par = 3
        courses[0].tees[2].holes[4].strokeIndex = 4
        courses[0].tees[2].holes[5].par = 4
        courses[0].tees[2].holes[5].strokeIndex = 5
        courses[0].tees[2].holes[6].par = 5
        courses[0].tees[2].holes[6].strokeIndex = 6
        courses[0].tees[2].holes[7].par = 3
        courses[0].tees[2].holes[7].strokeIndex = 7
        courses[0].tees[2].holes[8].par = 4
        courses[0].tees[2].holes[8].strokeIndex = 8
        courses[0].tees[2].holes[9].par = 5
        courses[0].tees[2].holes[9].strokeIndex = 9
        courses[0].tees[2].holes[10].par = 3
        courses[0].tees[2].holes[10].strokeIndex = 10
        courses[0].tees[2].holes[11].par = 4
        courses[0].tees[2].holes[11].strokeIndex = 11
        courses[0].tees[2].holes[12].par = 5
        courses[0].tees[2].holes[12].strokeIndex = 12
        courses[0].tees[2].holes[13].par = 3
        courses[0].tees[2].holes[13].strokeIndex = 13
        courses[0].tees[2].holes[14].par = 4
        courses[0].tees[2].holes[14].strokeIndex = 14
        courses[0].tees[2].holes[15].par = 5
        courses[0].tees[2].holes[15].strokeIndex = 15
        courses[0].tees[2].holes[16].par = 3
        courses[0].tees[2].holes[16].strokeIndex = 16
        courses[0].tees[2].holes[17].par = 4
        courses[0].tees[2].holes[17].strokeIndex = 17
        courses[0].tees[2].holes[18].par = 5
        courses[0].tees[2].holes[18].strokeIndex = 18
        
        courses.append(Course())
        courses[1].name = "Different Course"
        courses[1].location = "Crazy Town"
        courses[1].tees.append(Tee())
        courses[1].tees[0].color = "Red"
        courses[1].tees[0].parTotal = 73
        courses[1].tees[0].slope = 121
        courses[1].tees[0].rating = 71.0
        courses[1].tees[0].holes[1].par = 3
        courses[1].tees[0].holes[1].strokeIndex = 7
        courses[1].tees[0].holes[2].par = 4
        courses[1].tees[0].holes[2].strokeIndex = 8
        courses[1].tees[0].holes[3].par = 5
        courses[1].tees[0].holes[3].strokeIndex = 9
        courses[1].tees[0].holes[4].par = 3
        courses[1].tees[0].holes[4].strokeIndex = 10
        courses[1].tees[0].holes[5].par = 4
        courses[1].tees[0].holes[5].strokeIndex = 11
        courses[1].tees[0].holes[6].par = 5
        courses[1].tees[0].holes[6].strokeIndex = 12
        courses[1].tees[0].holes[7].par = 3
        courses[1].tees[0].holes[7].strokeIndex = 1
        courses[1].tees[0].holes[8].par = 4
        courses[1].tees[0].holes[8].strokeIndex = 2
        courses[1].tees[0].holes[9].par = 5
        courses[1].tees[0].holes[9].strokeIndex = 3
        courses[1].tees[0].holes[10].par = 3
        courses[1].tees[0].holes[10].strokeIndex = 4
        courses[1].tees[0].holes[11].par = 4
        courses[1].tees[0].holes[11].strokeIndex = 5
        courses[1].tees[0].holes[12].par = 5
        courses[1].tees[0].holes[12].strokeIndex = 6
        courses[1].tees[0].holes[13].par = 3
        courses[1].tees[0].holes[13].strokeIndex = 13
        courses[1].tees[0].holes[14].par = 4
        courses[1].tees[0].holes[14].strokeIndex = 14
        courses[1].tees[0].holes[15].par = 5
        courses[1].tees[0].holes[15].strokeIndex = 15
        courses[1].tees[0].holes[16].par = 3
        courses[1].tees[0].holes[16].strokeIndex = 16
        courses[1].tees[0].holes[17].par = 4
        courses[1].tees[0].holes[17].strokeIndex = 17
        courses[1].tees[0].holes[18].par = 5
        courses[1].tees[0].holes[18].strokeIndex = 18
        courses[1].tees.append(Tee())
        courses[1].tees[1].color = "White"
        courses[1].tees[1].parTotal = 70
        courses[1].tees[1].slope = 119
        courses[1].tees[1].rating = 69.3
        courses[1].tees[1].holes[1].par = 3
        courses[1].tees[1].holes[1].strokeIndex = 18
        courses[1].tees[1].holes[2].par = 3
        courses[1].tees[1].holes[2].strokeIndex = 17
        courses[1].tees[1].holes[3].par = 3
        courses[1].tees[1].holes[3].strokeIndex = 16
        courses[1].tees[1].holes[4].par = 3
        courses[1].tees[1].holes[4].strokeIndex = 15
        courses[1].tees[1].holes[5].par = 3
        courses[1].tees[1].holes[5].strokeIndex = 14
        courses[1].tees[1].holes[6].par = 3
        courses[1].tees[1].holes[6].strokeIndex = 13
        courses[1].tees[1].holes[7].par = 4
        courses[1].tees[1].holes[7].strokeIndex = 12
        courses[1].tees[1].holes[8].par = 4
        courses[1].tees[1].holes[8].strokeIndex = 11
        courses[1].tees[1].holes[9].par = 4
        courses[1].tees[1].holes[9].strokeIndex = 10
        courses[1].tees[1].holes[10].par = 4
        courses[1].tees[1].holes[10].strokeIndex = 9
        courses[1].tees[1].holes[11].par = 4
        courses[1].tees[1].holes[11].strokeIndex = 8
        courses[1].tees[1].holes[12].par = 4
        courses[1].tees[1].holes[12].strokeIndex = 7
        courses[1].tees[1].holes[13].par = 5
        courses[1].tees[1].holes[13].strokeIndex = 6
        courses[1].tees[1].holes[14].par = 5
        courses[1].tees[1].holes[14].strokeIndex = 5
        courses[1].tees[1].holes[15].par = 5
        courses[1].tees[1].holes[15].strokeIndex = 4
        courses[1].tees[1].holes[16].par = 5
        courses[1].tees[1].holes[16].strokeIndex = 3
        courses[1].tees[1].holes[17].par = 5
        courses[1].tees[1].holes[17].strokeIndex = 2
        courses[1].tees[1].holes[18].par = 5
        courses[1].tees[1].holes[18].strokeIndex = 1
        courses[1].tees.append(Tee())
        courses[1].tees[2].color = "Blue"
        courses[1].tees[2].parTotal = 75
        courses[1].tees[2].slope = 125
        courses[1].tees[2].rating = 77.0
        courses[1].tees[2].holes[1].par = 3
        courses[1].tees[2].holes[1].strokeIndex = 1
        courses[1].tees[2].holes[2].par = 3
        courses[1].tees[2].holes[2].strokeIndex = 2
        courses[1].tees[2].holes[3].par = 3
        courses[1].tees[2].holes[3].strokeIndex = 3
        courses[1].tees[2].holes[4].par = 4
        courses[1].tees[2].holes[4].strokeIndex = 4
        courses[1].tees[2].holes[5].par = 4
        courses[1].tees[2].holes[5].strokeIndex = 5
        courses[1].tees[2].holes[6].par = 4
        courses[1].tees[2].holes[6].strokeIndex = 6
        courses[1].tees[2].holes[7].par = 5
        courses[1].tees[2].holes[7].strokeIndex = 13
        courses[1].tees[2].holes[8].par = 5
        courses[1].tees[2].holes[8].strokeIndex = 14
        courses[1].tees[2].holes[9].par = 5
        courses[1].tees[2].holes[9].strokeIndex = 15
        courses[1].tees[2].holes[10].par = 3
        courses[1].tees[2].holes[10].strokeIndex = 16
        courses[1].tees[2].holes[11].par = 3
        courses[1].tees[2].holes[11].strokeIndex = 17
        courses[1].tees[2].holes[12].par = 3
        courses[1].tees[2].holes[12].strokeIndex = 18
        courses[1].tees[2].holes[13].par = 4
        courses[1].tees[2].holes[13].strokeIndex = 7
        courses[1].tees[2].holes[14].par = 4
        courses[1].tees[2].holes[14].strokeIndex = 8
        courses[1].tees[2].holes[15].par = 4
        courses[1].tees[2].holes[15].strokeIndex = 9
        courses[1].tees[2].holes[16].par = 5
        courses[1].tees[2].holes[16].strokeIndex = 10
        courses[1].tees[2].holes[17].par = 5
        courses[1].tees[2].holes[17].strokeIndex = 11
        courses[1].tees[2].holes[18].par = 5
        courses[1].tees[2].holes[18].strokeIndex = 12
    }
}


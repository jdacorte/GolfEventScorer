//
//  GameEditor.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/7/24.
//

import SwiftUI

struct GameEditor: View {
    @EnvironmentObject var gES: GolfEventScorer
    @Environment(\.dismiss) private var dismiss
    var event: Event
    @Binding var gameIndex: Int
    var isNew: Bool
    @State private var gameCopy = Game()
    @State private var courseOptions = [String]()
    @State private var gameInfoNotComplete = false
    let columns = Array(repeating: GridItem(.flexible(minimum: 15)), count: 9)
    
    var body: some View {
        VStack {
            if isNew {
                Text("Game \(event.games.count + 1)")
                    .font(.title2)
            } else {
                Text("Game \(gameIndex + 1)")
                    .font(.title2)
            }
            if event.started {
                
                Text(event.games[gameIndex].type)
                Text(event.games[gameIndex].course)
                LazyVGrid(columns: columns) {
                    ForEach(1..<19) { holeNum in
                        HoleSelector(game: $gameCopy, holeNum: holeNum, enableSelection: false)
                            .padding(2)
                    }
                }
            } else {
                Menu {
                    Picker(selection: $gameCopy.type) {
                        ForEach(K.Games.gameOptions, id: \.self) {
                            Text("\($0)")
                        }
                        .font(.title3)
                    } label: {}
                } label: {
                    Text(gameCopy.type)
                        .font(.title3)
                }.id(gameCopy.type)
                
                Menu {
                    Picker(selection: $gameCopy.course) {
                        //                        ForEach(gES.courses, id: \.self) { course in
                        //                            Text(course.name)
                        //                        ForEach(K.Course.courseOptions, id: \.self) {
                        ForEach(courseOptions, id: \.self) {
                            Text("\($0)")
                            
                        }
                        .font(.title3)
                    } label: {}
                } label: {
                    Text(gameCopy.course)
                        .font(.title3)
                }.id(gameCopy.course)
                Text("Holes To Play")
                HStack {
                    Button {
                        for hole in 1..<19 {
                            gameCopy.holesToPlay[hole] = true
                        }
                    } label: {
                        Text("All")
                    }
                    .buttonStyle(.borderedProminent).tint(.indigo)
                    Button {
                        for hole in 1..<10 {
                            gameCopy.holesToPlay[hole] = true
                        }
                    } label: {
                        Text("Front")
                    }
                    .buttonStyle(.borderedProminent).tint(.indigo)
                    Button {
                        for hole in 10..<19 {
                            gameCopy.holesToPlay[hole] = true
                        }
                    } label: {
                        Text("Back")
                    }
                    .buttonStyle(.borderedProminent).tint(.indigo)
                }
                // I don't think this needs to be LazyVGrid, maybe just grid?
                
                LazyVGrid(columns: columns) {
                    ForEach(1..<19) { holeNum in
                        HoleSelector(game: $gameCopy, holeNum: holeNum, enableSelection: true)
                            .padding(2)
                    }
                }.padding(15)
            }
            Spacer()
        }
        .onAppear {
            if !isNew {
                gameCopy = event.games[gameIndex] // Grab a copy in case we decide to make edits.
            }
            for course in gES.courses {
                courseOptions.append(course.name)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
            if !event.started {
                ToolbarItem(placement: .principal) {
                    Button {
                        if !isNew {
                            gES.deleteEventGame(event: event, game: event.games[gameIndex])
                            //                            gES.buildEventScorecardGrid(event)
                        }
                        dismiss()
                    } label: {
                        if isNew {
                            Text("")
                        } else {
                            Label("", systemImage: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
                ToolbarItem {
                    Button {
                        if gameCopy.type != "Select Game" && gameCopy.course != "Select Course" && gameCopy.totalGameHoles > 0 {
                            if isNew {
                                gES.addEventGame(event: event, game: gameCopy)
                                dismiss()
                            } else {
                                gES.modifyEventGame(event: event, game: gameCopy)
                                dismiss()
                            }
                        } else {
                            gameInfoNotComplete = true
                        }
                        
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
                .alert(K.Games.incompleteGameInfo, isPresented: $gameInfoNotComplete) {
                    Button("OK", role: .cancel) {
                    }
                }
    }
}




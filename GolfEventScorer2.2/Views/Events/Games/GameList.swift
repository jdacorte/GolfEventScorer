//
//  GameList.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/7/24.
//

import SwiftUI

struct GameList: View {
    var event: Event
    @State private var isAddingNewGame = false
    @State private var isEditingGame = false
    @State private var selectedGame = Game()
    @State private var gameIndex = 0
    
    var body: some View {
        NavigationView {
            VStack {
                if !event.started {
                    Button {
                        isAddingNewGame = true
                    } label: {
                        Image(systemName: "plus")
                    }.frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                
                Text("Games")
                    .font(.title3)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                ScrollView {
                    ForEach(Array(event.games.enumerated()), id: \.element) { index, game in
                        Button {
                            gameIndex = index
                            isEditingGame = true
                        }
                        label: {
                            GameSummary(game: game)
                        }
                    }
                }
                .frame(maxWidth:.infinity)
            }
            .padding()
            .sheet(isPresented: $isAddingNewGame) {
                NavigationView {
                    GameEditor(event: event, gameIndex: $gameIndex, isNew: true)
                }
            }
            .background(Color(.systemGray2))
            .cornerRadius(10)
            .sheet(isPresented: $isEditingGame) {
                NavigationView {
                    GameEditor(event: event, gameIndex: $gameIndex, isNew: false)
                }
            }
        }
    }
}


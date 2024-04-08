//
//  PlayerEditor.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/18/24.
//

import SwiftUI

struct PlayerEditor: View {
    @EnvironmentObject var gES: GolfEventScorer
    @Environment(\.dismiss) private var dismiss
    @Binding var player: Player
    var isNew: Bool
    
    @State private var playerCopy = Player()
    
    var body: some View {
        VStack {
            Text("Player Information").font(.pageTitleFont)
            
            TextField("Player Name", text: $playerCopy.name)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
            
            
            TextField("HI", value: $playerCopy.hi, format: .number, prompt: Text("Handicap Index"))
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
            
            Menu {
                Picker(selection: $playerCopy.teeChoice) {
                    ForEach(K.Tees.teeOptions, id: \.self) {
                        Text("\($0)")
                    }
                    .font(.title3)
                } label: {}
            } label: {
                Text(playerCopy.teeChoice)
                    .font(.title3)
            }.id(playerCopy.teeChoice)
            // tee choice
            
            Spacer()
        }
        .onAppear {
            if !isNew {
                playerCopy = player // Grab a copy in case we decide to make edits.
            }
           
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
            ToolbarItem(placement: .principal) {
                if !isNew {
                    Button {
                        gES.deletePlayer(player)
                        dismiss()
                    } label: {
                        Label("", systemImage: "trash")
                            .foregroundColor(.red)
                    }
                }
                
            }
            ToolbarItem {
                Button {
                    if isNew {
                        gES.addPlayer(playerCopy)
                        dismiss()
                    } else {
                        gES.modifyPlayer(playerCopy)
                        dismiss()
                    }
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

//#Preview {
//    PlayerEditor()
//}

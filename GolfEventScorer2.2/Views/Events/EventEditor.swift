//
//  EventEditor.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/5/24.
//

import SwiftUI

struct EventEditor: View {
    @EnvironmentObject var gES: GolfEventScorer
    @Environment(\.dismiss) private var dismiss
    var event: Event
    var isNew: Bool
    @State private var eventCopy = Event()

    var body: some View {
        VStack {
            TextField("Event Name", text: $eventCopy.name)
                .multilineTextAlignment(.center)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
            DatePicker("Date", selection: $eventCopy.date, displayedComponents: .date)
                .labelsHidden()
                .listRowSeparator(.hidden)
            Toggle("Use Handicap", isOn: $eventCopy.useHandicap).frame(width: 150).padding(10).toggleStyle(.switch)
            Toggle("Teams", isOn: $eventCopy.playingTeams).frame(width: 150).padding(10).toggleStyle(.switch)
            Spacer()
        }
        .onAppear {
            eventCopy = event // Grab a copy in case we decide to make edits.
        }
        .toolbar {
            ToolbarItem {
                Button {
                    if isNew {
                        gES.addEvent(eventCopy)
                        dismiss()
                    } else {
                        gES.modifyEvent(eventCopy)
                        dismiss()
                    }
                } label: {
                    Text("Save")
                }
            }
        }
    }
}



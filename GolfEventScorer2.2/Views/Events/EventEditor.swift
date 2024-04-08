//
//  EventEditor.swift
//  GolfEventScorer2.2
//
//  Created by John DaCorte on 3/5/24.
//

import SwiftUI

struct EventEditor: View {
    @EnvironmentObject var eventData: EventData
    @Environment(\.dismiss) private var dismiss
    
    var event: Event
    var isNew: Bool
    
    @State private var isDeleted = false
  
    // Keep a local copy in case we make edits, so we don't disrupt the list of events.
    // This is important for when the date changes and puts the event in a different section.
    @State private var eventCopy = Event()
    @State private var isEditing = false
    
//    private var isEventDeleted: Bool {
//        !eventData.exists(event) && !isNew
//    }
    
    var body: some View {
        VStack {
            EventDetail(event: eventCopy, isEditing: isNew ? true : isEditing)
                .toolbar {
//                    ToolbarItem(placement: .cancellationAction) {
//                        if isNew {
//                            Button("Cancel") {
//                                dismiss()
//                            }
//                        }
//                    }
                    ToolbarItem {
                        Button {
                            if isNew {
                                eventData.add(event)
//                                eventData.events.append(eventCopy)
                                dismiss()
                            } else {
                                if isEditing && !isDeleted {
                                    print("Done, saving any changes to \(event.name).")
                                    withAnimation {
//                                        event = eventCopy // Put edits (if any) back in the store.
                                    }
                                }
                                isEditing.toggle()
                            }
                        } label: {
                            Text(isNew ? "Add" : (isEditing ? "Done" : "Edit"))
                        }
                    }
                }
                .onAppear {
                    eventCopy = event // Grab a copy in case we decide to make edits.
                }
//                .disabled(isEventDeleted)

            if isEditing && !isNew {

                Button(role: .destructive, action: {
                    isDeleted = true
                    dismiss()
                    eventData.delete(event)
                }, label: {
                    Label("Delete Event", systemImage: "trash.circle.fill")
                        .font(.title2)
                        .foregroundColor(.red)
                })
                    .padding()
            }
        }
//        .overlay(alignment: .center) {
//            if isEventDeleted {
//                Color(UIColor.systemBackground)
//                Text("Event Deleted. Select an Event.")
//                    .foregroundStyle(.secondary)
//            }
//        }
    }
}

//#Preview {
//    EventEditor()
//}

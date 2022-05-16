//
//  NotesDetailView.swift
//  NotesViper (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 15/05/22.
//

import SwiftUI

struct NotesDetailView: View {
    var note: NoteModel
    var body: some View {
        VStack() {
                 Text("Title: \(note.title)")
                 Text("Body: \(note.body)")
                 Spacer()
        }
    }
}

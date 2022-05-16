//
//  NoteModel.swift
//  NotesViper (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 15/05/22.
//

import Foundation


struct NoteModel: NoteEntity{
    
    var title: String
    var body: String
    var date: Date?
    var id: UUID
    
  
}

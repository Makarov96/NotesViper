//
//  NoteEntity.swift
//  NotesViper (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 15/05/22.
//

import Foundation


protocol NoteEntity{
    var title: String {get set}
    var body:String {get set}
    var date: Date? {get set}
    var id: UUID {get set}
}

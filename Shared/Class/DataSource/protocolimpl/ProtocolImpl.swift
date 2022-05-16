//
//  ProtocolImpl.swift
//  NotesViper (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 15/05/22.
//

import Foundation
import Combine

class ProtocolImpl{
    private let localDataProvider: LocalDataProvider
    private var cancellables = Set<AnyCancellable>()
    @Published var notes:[Notes] = []
    
    init(localDataProvider: LocalDataProvider){
        self.localDataProvider = localDataProvider
        
        setUp()
        
    }
    
    
    
    private func setUp(){
        self.localDataProvider.notesPublisher.assign(to: \.notes, on: self).store(in: &cancellables)
    }
    
    func addNewNote(note:NoteEntity){
        localDataProvider.addNewNote(noteModel: note)
    }
    
    func delete(_ note: Notes){
        localDataProvider.delete(note)
    }
    
    func deleteAllNotes(){
        localDataProvider.deleteAllNotes()
    }
}

//
//  NotesInteractor.swift
//  NotesViper (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 15/05/22.
//

import Foundation
import Combine


class NotesInteractor{
    
    private let formatter = DateFormatter()
    private let dataLayer: ProtocolImpl
    private var cancellables = Set<AnyCancellable>()
    @Published var notesModel:[NoteModel] = []
    
    init(dataLayer: ProtocolImpl){
        formatter.dateStyle = .medium
        self.dataLayer = dataLayer
        setUp()
    }
    
    
    private func setUp(){
       
        
        self.dataLayer.$notes
                  .map({ notes -> [NoteModel] in
                      return notes.map{
                          NoteModel(title: $0.title ?? "", body: $0.body ?? "", date: $0.date , id: $0.id ?? UUID())
                      }
                  })
                  .replaceError(with: [])
                  .assign(to: \.notesModel, on: self)
                  .store(in: &cancellables)
        
    }
    
    
    func showAddButton() -> Bool{
        notesModel.count < 10
    }
    
    func deleteAllNotes(){
        dataLayer.deleteAllNotes()
    }
    
    func addNewNote(){
        dataLayer.addNewNote(note: NoteModel(title: "Note \(notesModel.count)", body: "No body", date: Date(), id: UUID()))
    }
    
    func deleteNote(_ index: IndexSet){
        var notesCopy = notesModel
        notesCopy.move(fromOffsets: index, toOffset: 0)
        if let noteToDelete =  dataLayer.notes.filter({notesCopy.first!.id == $0.id}).first{
            dataLayer.delete(noteToDelete)
        }
        
    }
}

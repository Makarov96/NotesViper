//
//  DataProvider.swift
//  NotesViper (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 15/05/22.
//

import Foundation
import CoreData
import Combine

protocol LocalDataProvider {
    var notesPublisher: Published<[Notes]>.Publisher{get}
    func addNewNote(noteModel:NoteEntity)
    func delete(_ note:Notes)
    func deleteAllNotes()
}



class CoreLocalDataStack{
    private var manageObjectContext: NSManagedObjectContext
    private var cancellables = Set<AnyCancellable>()
    
    @Published var notes: [Notes] = []
    
    init(context: NSManagedObjectContext){
        self.manageObjectContext = context
        publish()
    }
    
    private  func allNotes()->[Notes]{
        do{
            let fetchRequest: NSFetchRequest<Notes> = Notes.fetchRequest()
            return try self.manageObjectContext.fetch(fetchRequest)
            
        }catch let error as NSError{
            print("\(error), \(error.userInfo)")
            return []
        }
    }
    
    private func save() {
         do {
             try self.manageObjectContext.save()
         } catch let error as NSError {
             print("\(error), \(error.userInfo)")
         }
         publish()
     }
     
    
    private func publish(){
        notes = allNotes()
    }
    
}


extension CoreLocalDataStack: LocalDataProvider{
    var notesPublisher: Published<[Notes]>.Publisher {
        $notes
    }
    
    func addNewNote(noteModel: NoteEntity) {
        var note = Notes(context: manageObjectContext)
        note.id = noteModel.id
        note.title = noteModel.title
        note.body = noteModel.body
        note.date = noteModel.date 
        
        save()
    }
    
    func delete(_ note: Notes) {
        self.manageObjectContext.delete(note)
        save()
    }
    
    func deleteAllNotes() {
        allNotes().forEach{
            object in
            manageObjectContext.delete(object)
        }
    }
    
    
}

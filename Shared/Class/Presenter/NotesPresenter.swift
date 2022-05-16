//
//  NotesPresenter.swift
//  NotesViper (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 15/05/22.
//

import Foundation
import Combine
import SwiftUI

class NotesPresenter: ObservableObject{
    private let interactor: NotesInteractor
    private let router = NotesRouter()
    private var cancellables = Set<AnyCancellable>()
    @Published var notesModel: [NoteModel] = []
    
    init(interactor: NotesInteractor){
        self.interactor = interactor
        interactor.$notesModel.assign(to: \.notesModel, on: self)
            .store(in: &cancellables)
    }
    
    
    func topButton()-> some View{
        if interactor.showAddButton(){
            return Button(action: interactor.addNewNote, label: {
                Image(systemName: "plus")
            })
        }else{
            return Button(action: interactor.deleteAllNotes) {
                Image(systemName: "trash")
            }
        }
    }
    
    func addNewNote(){
        interactor.addNewNote()
    }
    
    func delete(_ index: IndexSet){
        interactor.deleteNote(index)
    }
    
    func detailView(note: NoteModel) -> some View{
        router.detailView(note: note)
    }
    
}

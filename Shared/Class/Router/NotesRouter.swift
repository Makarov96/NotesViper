//
//  NotesRouter.swift
//  NotesViper (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 15/05/22.
//

import Foundation
import SwiftUI
import CoreData

class NotesRouter{
    func ListView(context: NSManagedObjectContext)->some View{
        let persistence = CoreLocalDataStack(context:  context)
        let dataLayer = ProtocolImpl(localDataProvider: persistence)
        let contentView = NotesListView(presenter: NotesPresenter(interactor: NotesInteractor(dataLayer: dataLayer)))
       // return contentView;
        
        return contentView
    }
    
    func detailView(note: NoteModel) -> some View {
        NotesDetailView(note: note)
    }
    
}

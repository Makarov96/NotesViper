//
//  NotesListView.swift
//  NotesViper (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 15/05/22.
//

import SwiftUI

struct NotesListView: View {
    @StateObject var presenter: NotesPresenter
    
    var body: some View {
        NavigationView{
            List{
                ForEach(presenter.notesModel, id: \.id){
                    item in
                    NavigationLink(item.title, destination: self.presenter.detailView(note: item))
                }
                .onDelete(perform: presenter.delete)
            } .navigationBarTitle("Notes", displayMode: .inline)
                .navigationBarItems(trailing:
                    presenter.topButton()
                )
        }
    }
}

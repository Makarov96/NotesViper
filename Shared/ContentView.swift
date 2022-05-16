//
//  ContentView.swift
//  Shared
//
//  Created by Guerin Steven Colocho Chacon on 15/05/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let router:NotesRouter = NotesRouter()


    var body: some View {
        router.ListView(context: viewContext)
    }




}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

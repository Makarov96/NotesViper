//
//  Notes+CoreDataProperties.swift
//  NotesViper (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 15/05/22.
//
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var body: String?
    @NSManaged public var date: Date?
    @NSManaged public var title: String?

}

extension Notes : Identifiable {

}

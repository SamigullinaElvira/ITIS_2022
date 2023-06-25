//
//  Note+Extensions.swift
//  Dopka22
//
//  Created by Эльвира Самигуллина on 25.02.2023.
//

import Foundation
import CoreData

extension Note {
    class func allNotesFetchRequest(
    ) -> NSFetchRequest<Note> {
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(
                keyPath: \Note.content, ascending: true
            )
        ]
        return fetchRequest
    }
}

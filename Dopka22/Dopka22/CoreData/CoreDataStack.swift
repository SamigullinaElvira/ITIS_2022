//
//  CoreDataStack.swift
//  Dopka22
//
//  Created by Эльвира Самигуллина on 25.02.2023.
//

import CoreData

class CoreDataStack {
    static var shared: CoreDataStack = .init(name: "Dopka22")

    lazy var viewContext: NSManagedObjectContext = container.viewContext

    private let container: NSPersistentContainer

    init(name: String) {
        let container = NSPersistentContainer(name: name)
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Could not load persistent stores: \(error)")
            }
        }
        self.container = container
    }

    func save() throws {
        guard viewContext.hasChanges else { return }

        try viewContext.save()
    }
}

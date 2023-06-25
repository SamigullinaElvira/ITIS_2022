//
//  NotesViewController.swift
//  Dopka22
//
//  Created by Teacher on 24.02.2023.
//

import UIKit
import CoreData

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    @IBOutlet private var tableView: UITableView!

    @IBOutlet private var noteField: UITextField!

    @IBAction
    private func saveTap() {
        note = Note(
            entity: Note.entity(),
            insertInto: CoreDataStack.shared.viewContext
        )
        note.content = noteField.text
        try? CoreDataStack.shared.save()
        tableView.reloadData()
    }
    
    var note: Note!
    var notes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchedResults.delegate = self
        do {
            try fetchedResults.performFetch()
            tableView.reloadData()
        } catch {
            print("Could not fetch data: \(error)")
        }
    }
    
    private let fetchedResults: NSFetchedResultsController<Note> = .init(
        fetchRequest: Note.allNotesFetchRequest(),
        managedObjectContext: CoreDataStack.shared.viewContext,
        sectionNameKeyPath: nil,
        cacheName: nil
    )
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedResults.fetchedObjects?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = fetchedResults.object(at: indexPath)
        var contentConfiguration = UIListContentConfiguration.valueCell()
        contentConfiguration.text = note.content ?? "Empty"

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.contentConfiguration = contentConfiguration
        return cell
    }

    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [unowned self] _, _, finished in
            let note = fetchedResults.object(at: indexPath)
            CoreDataStack.shared.viewContext.delete(note)
            do {
                try CoreDataStack.shared.save()
                finished(true)
            } catch {
                print("Could not delete note: \(error)")
                finished(true)
            }
        }

        return UISwipeActionsConfiguration(actions: [ deleteAction ])
    }
    
    func controllerDidChangeContent(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>
    ) {
        tableView.reloadData()
    }
}

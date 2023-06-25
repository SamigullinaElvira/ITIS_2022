//
//  NewNoteViewController.swift
//  UserDefaultsHW
//
//  Created by Эльвира Самигуллина on 02.12.2022.
//

import UIKit

class NewNoteViewController: UIViewController {

	@IBOutlet var titleField: UITextField!
	@IBOutlet var contentView: UITextView!
	
	let currentDateTime = Date()
	let formate = DateFormatter()
	
	var notes: [Note] = []
    
	var note: Note?
	
	var finished: ([Note]) -> Void = { _ in }
	
	@IBAction func saveButtonDidTap(_ sender: Any) {
		guard let title = titleField.text, let content = contentView.text else { return }
		
		formate.timeStyle = .medium
		formate.dateStyle = .long
        note = Note(title: title, content: content, creationDate: formate.string(from: currentDateTime), type: type.textNote.rawValue, fileName: nil)
        
		if let note {
			notes.append(note)
			notes.sort(by: {$0.creationDate > $1.creationDate})
			finished(notes)
		}
        
        dismiss(animated: true)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

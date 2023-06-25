//
//  NoteViewController.swift
//  UserDefaultsHW
//
//  Created by Эльвира Самигуллина on 02.12.2022.
//

import UIKit

class NoteViewController: UIViewController {

	@IBOutlet var titleField: UITextField!
	@IBOutlet var contentView: UITextView!
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
	
	var titleText: String?
	var contentText: String?
	
	var notes: [Note] = []
	var rowId = 0
	
	@UserDefault(key: "note")
	var note: Note?
	
	var finished: ([Note]) -> Void = { _ in }
	
    @IBAction func saveDidTap(_ sender: Any) {
        guard let title = titleField.text, let content = contentView.text else { return }
        
        if note != nil {
            notes[rowId].title = title
            notes[rowId].content = content
            print(title, content)
            finished(notes)
        }
        
        dismiss(animated: true)
    }
    
    @IBAction func deleteButtonDidTap(_ sender: Any) {
        notes.remove(at: rowId)
        finished(notes)
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleField.text = titleText
        contentView.text = contentText
    }
}

import UIKit
class AddNoteViewController: UIViewController {

	@IBOutlet var titleField: UITextField!
	@IBOutlet var contentView: UITextView!
	
	let currentDateTime = Date()
	let formate = DateFormatter()
	
	var notes: [Note] = []
	
	@UserDefault(key: "note")
	var note: Note?
	
	var finished: ([Note]) -> Void = { _ in }
	
	@IBAction func saveButtonDidTap(_ sender: Any) {
		guard let title = titleField.text, let content = contentView.text else { return }
		
		formate.timeStyle = .medium
		formate.dateStyle = .long
		note = Note(title: title, content: content, creationDate: formate.string(from: currentDateTime))
        print(note)
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

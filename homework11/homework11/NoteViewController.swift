import UIKit
class NoteViewController: UIViewController {

	@IBOutlet var titleField: UITextField!
	@IBOutlet var contentView: UITextView!
	
	var titleText: String?
	var contentText: String?
	
	var notes: [Note] = []
	var rowId = 0
	
	@UserDefault(key: "note")
	var note: Note?
	
	var finished: ([Note]) -> Void = { _ in }
	
	@IBAction func saveButtonDidTap(_ sender: Any) {
		guard let title = titleField.text, let content = contentView.text else { return }
		
		if note != nil {
			notes[rowId].title = title
			notes[rowId].content = content
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
		setup()
	}
	
	func setup() {
		titleField.text = titleText
		contentView.text = contentText
	}


}

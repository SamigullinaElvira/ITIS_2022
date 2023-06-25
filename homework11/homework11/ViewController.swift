import UIKit


protocol UserDefaultable {
	var storedValue: Any { get }
	init?(storedValue: Any?)
}

@propertyWrapper
struct UserDefault<T: UserDefaultable> {
	var wrappedValue: T? {
		get {
			T(storedValue: UserDefaults.standard.value(forKey: key))
		}
		set {
			if let newValue {
				UserDefaults.standard.set(newValue.storedValue, forKey: key)
			} else {
				UserDefaults.standard.removeObject(forKey: key)
			}
		}
	}

	private let key: String

	init(key: String) {
		self.key = key
	}
}


class ViewController: UIViewController {

	@IBOutlet var notesTableView: UITableView!
	
	var notes: [Note] = []
	
	@IBAction func addNoteDidTap(_ sender: Any) {
		let controller: AddNoteViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddNoteViewController") as! AddNoteViewController
		present(controller, animated: true)
		
		controller.notes = notes
		controller.finished = { notes in
			self.notes = notes
			self.notesTableView.reloadData()
		}
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		notesTableView.delegate = self
		notesTableView.dataSource = self
	}
	
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		notes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard
			let cell = tableView
			.dequeueReusableCell(
				withIdentifier: "Cell", for: indexPath
			)
			as? NoteTableViewCell
		else {
			fatalError("Could not deque cell of type \(NoteTableViewCell.self)")
		}
		
		var configuration = UIListContentConfiguration.cell()
		configuration.text = notes[indexPath.row].title
		configuration.secondaryText = notes[indexPath.row].creationDate
		
		cell.contentConfiguration = configuration
		
		return cell
	}
	

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let controller: NoteViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoteViewController") as! NoteViewController
		
		controller.notes = notes
		controller.titleText = notes[indexPath.row].title
		controller.contentText = notes[indexPath.row].content
		controller.rowId = indexPath.row
		
		present(controller, animated: true)
		
		controller.finished = { notes in
			self.notes = notes
			self.notesTableView.reloadData()
		}
	}
	
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		true
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		70
	}
}


//
//  ViewController.swift
//  UserDefaultsHW
//
//  Created by Эльвира Самигуллина on 02.12.2022.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var tableView: UITableView!
	
//    let mockData = MockData()

	var notes: [Note] = []
	
	@IBAction func addNoteDidTap(_ sender: Any) {
		let controller: NewNoteViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewNoteViewController") as! NewNoteViewController
		present(controller, animated: true)
		
		controller.notes = notes
		controller.finished = { notes in
			self.notes = notes
			self.tableView.reloadData()
		}
	}
	
    @IBAction func addPhotoNoteDidTap(_ sender: Any) {
        let controller: NewPhotoNoteViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewPhotoNoteViewController") as! NewPhotoNoteViewController
        present(controller, animated: true)
        
        controller.notes = notes
        controller.finished = { notes in
            self.notes = notes
            self.tableView.reloadData()
        }
    }
    
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
	}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		notes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "text")
        cell.textLabel?.text = notes[indexPath.row].title
        if (notes[indexPath.row].type == type.textNote.rawValue) {
            cell.detailTextLabel?.text = notes[indexPath.row].creationDate
        }
        else if (notes[indexPath.row].type == type.photoNote.rawValue) {
            cell.detailTextLabel?.text = notes[indexPath.row].content
        }
        return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let noteType = notes[indexPath.row].type
        
        if (noteType == type.textNote.rawValue) {
            let controller: NoteViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NoteViewController") as! NoteViewController
            
            controller.notes = notes
            controller.titleText = notes[indexPath.row].title
            controller.contentText = notes[indexPath.row].content
            controller.rowId = indexPath.row
            
            present(controller, animated: true)
            
            controller.finished = { notes in
                self.notes = notes
                self.tableView.reloadData()
            }
        }
        else if (noteType == type.photoNote.rawValue) {
            let controller: PhotoNoteViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotoNoteViewController") as! PhotoNoteViewController
            
            controller.notes = notes
            controller.titleText = notes[indexPath.row].title
            controller.imageNameText = notes[indexPath.row].content
            controller.rowId = indexPath.row
            
            present(controller, animated: true)
            
            controller.finished = { notes in
                self.notes = notes
                self.tableView.reloadData()
            }
        }
	}
	
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		true
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		70
	}
}


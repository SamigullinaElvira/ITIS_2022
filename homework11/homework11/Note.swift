import Foundation

struct Note {
	var title: String
	var content: String
	let creationDate: String
}

extension Note: UserDefaultable {
	var storedValue: Any {
		[
			"title": title,
			"content": content,
			"creationDate": creationDate
		]
	}

	init?(storedValue: Any?) {
		guard
			let dictionary = storedValue as? [String: String],
			let title = dictionary["title"],
			let content = dictionary["content"],
			let creationDate = dictionary["creationDate"]
		else { return nil }

		self.title = title
		self.content = content
		self.creationDate = creationDate
		
	}
}

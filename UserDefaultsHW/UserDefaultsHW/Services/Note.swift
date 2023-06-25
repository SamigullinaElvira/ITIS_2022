//
//  Note.swift
//  UserDefaultsHW
//
//  Created by Эльвира Самигуллина on 09.12.2022.
//

import Foundation

struct Note {
	var title: String
	var content: String
	let creationDate: String
    var type: String
    var fileName: String?
}

enum type: String {
    case textNote = "textNote"
    case photoNote = "photoNote"
}

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
			let creationDate = dictionary["creationDate"],
            let type = dictionary["type"],
            let fileName = dictionary["fileName"]
		else { return nil }

		self.title = title
		self.content = content
		self.creationDate = creationDate
        self.type = type
        self.fileName = fileName
	}
}

//
//  Magazine.swift
//  Homework6
//
//  Created by elya on 22.10.2022.
//

import Foundation

struct Magazine {
    let name: String
    let price: Double
    let pageCount: Int
    let year: Int
    let number: Int
    
    public static func random() -> Magazine {
        Magazine(
            name: randomName(), price: Double.random(in: 5..<20),
                pageCount: Int.random(in: 30...150), year: Int.random(in: 2012..<2022),
                number: Int.random(in: 1...12)
            )
        }

        private static func randomName() -> String {
            ["Forbes", "The New Yorker", "Game Informer", "People", "Harper’s Bazaar", "Vogue", "National Geographic", "Good Housekeeping", "Elle", "Cosmopolitan", "Vanity Fair", "Car and Driver"]
                .randomElement() ?? ""
        }
}


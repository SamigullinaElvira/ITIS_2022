//
//  Team.swift
//  exam
//
//  Created by Эльвира Самигуллина on 14.01.2023.
//

import Foundation

struct Team: Codable {
    let id: String
    let name: String
    let players: [Player]
}

struct Player: Codable {
    let id: String
    let name: String
}



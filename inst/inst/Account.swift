//
//  Account.swift
//  inst
//
//  Created by Эльвира Самигуллина on 19.11.2022.
//

import Foundation

struct Accounts: Codable {
    let accounts: [Account]
}

struct Account: Codable {
    let user: UserData
    let discovers: [DiscoversData]
}

struct UserData: Codable {
    let status: String
    let posts: Int
    let followers: Int
    let name: String
    let following: Int
    let avatar: URL
}

struct DiscoversData: Codable {
    let followingFriends: [String]
    let kind: String
    let name: String
    let avatar: URL
}


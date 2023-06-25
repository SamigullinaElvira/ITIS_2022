//
//  NetworkManager.swift
//  exam
//
//  Created by Эльвира Самигуллина on 14.01.2023.
//

import Foundation
 
enum NetworkError: Error {
    case invalidURL
    case noData
}

enum Links: String {
    case req = "https://raw.githubusercontent.com/AZigangaraev/Exam2022-1/main/var2.json"
}
 
class NetworkManager {
    static let shared = NetworkManager()
 
    private init() {}
 
//    func getPlayersData() async throws -> [Player] {
//        guard let url = URL(string: Links.reqres.rawValue) else {
//            throw NetworkError.invalidURL
//        }
//
//        let (data, _) = try await URLSession.shared.data(from: url)
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        let team = try decoder.decode(Team.self, from: data)
//        return team.players
//    }
    
    func getTeams() async throws -> [Team] {
        guard let url = URL(string: Links.req.rawValue) else {
            throw NetworkError.invalidURL
        }
 
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let team = try decoder.decode([Team].self, from: data)
        return team
    }
}

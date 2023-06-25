//
//  NetworkManager.swift
//  inst
//
//  Created by Эльвира Самигуллина on 19.11.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
}

enum Links: String {
    case reqres = "https://raw.githubusercontent.com/AZigangaraev/images/main/instagram.json"
}

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}
    
    func getAccounts() async throws -> [Account] {
        guard let url = URL(string: Links.reqres.rawValue) else {
            throw NetworkError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let account = try decoder.decode(Accounts.self, from: data)
        return account.accounts
    }
}


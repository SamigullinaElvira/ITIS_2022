//
//  CatalogService.swift
//  OnlineShop
//
//  Created by Эльвира Самигуллина on 17.02.2023.
//

import Foundation
import Combine

enum CatalogError: Error {
    case unloaded
}

protocol CatalogService {

    func download() async throws -> [Product]
}

class MockCatalogService: CatalogService {
    static let shared: MockCatalogService = .init()
    
    private let products: [Product] = [
        Product(name: "Карандаши", details: "Набор цветных карандашей Creativiki, 12 шт"),
        Product(name: "Ручка", details: "Ручка гелевая Erich Krause G-Star 0.5, черная"),
        Product(name: "Бумага", details: "Бумага офисная SvetoCopy, 500 листов, А4"),
    ]

    func download() async throws -> [Product] {
        try? await Task.sleep(for: .seconds(1))
        if products.isEmpty {
            throw CatalogError.unloaded
        } else {
            return products
        }
    }
}

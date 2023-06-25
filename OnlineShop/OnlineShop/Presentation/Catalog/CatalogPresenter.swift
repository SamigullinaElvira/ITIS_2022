//
//  CatalogPresenter.swift
//  OnlineShop
//
//  Created by Эльвира Самигуллина on 17.02.2023.
//

import UIKit

@MainActor
class CatalogPresenter {
    var catalogService: CatalogService = MockCatalogService.shared
    
    weak var view: CatalogViewController?
    weak var coordinator: CatalogCoordinator!
    
    private var products: [Product] = [] {
        didSet {
            view?.reload()
        }
    }
    var productsCount: Int {
        return products.count
    }
    
    func download() async throws {
        Task {
            do {
                products = try await catalogService.download()
            } catch {
                throw CatalogError.unloaded
            }
        }
    }
    
    func setCellConfiguration(cell: UITableViewCell, row: Int) {
        let product = products[row]
        var configuration = UIListContentConfiguration.cell()
        configuration.text = product.name
        configuration.secondaryText = product.details
        cell.contentConfiguration = configuration
    }
    
    func showDetails(navigation: UINavigationController, row: Int) {
        coordinator.navigationController = navigation
        coordinator.pushDetails(item: products[row])
    }
}

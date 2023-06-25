//
//  CatalogCoordinator.swift
//  OnlineShop
//
//  Created by Эльвира Самигуллина on 17.02.2023.
//

import Foundation
import UIKit

class CatalogCoordinator {
    weak var navigationController: UINavigationController?
    static let shared: CatalogCoordinator = .init()
    
    private let storyboard: UIStoryboard = .init(name: "Main", bundle: nil)
    
    func pushDetails(item: Product) {
        let controller: DetailsViewController = storyboard.instantiateViewController(identifier: "DetailsViewController")
        let presenter = DetailsPresenter(product: item)
        controller.presenter = presenter
        presenter.view = controller
        navigationController?.pushViewController(controller, animated: true)
    }
}

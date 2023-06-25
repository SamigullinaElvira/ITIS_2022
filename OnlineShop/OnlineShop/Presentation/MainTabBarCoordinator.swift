//
//  MainTabBarCoordinator.swift
//  OnlineShop
//
//  Created by Teacher on 11.02.2023.
//

import UIKit

@MainActor
class MainTabBarCoordinator {
    weak var window: UIWindow?
    weak var tabBarController: UITabBarController?

    func start() -> UIViewController {
        let tabBarController = UITabBarController()
        self.tabBarController = tabBarController
        tabBarController.viewControllers = [
            shopping(),
            profile(),
        ]
        return tabBarController
    }

    private let storyboard: UIStoryboard = .init(name: "Main", bundle: nil)

    private func shopping() -> UIViewController {
        let controller: CatalogViewController = storyboard.instantiateViewController(identifier: "CatalogViewController")
        controller.tabBarItem = .init(
            title: "Catalog",
            image: .init(systemName: "cart"),
            selectedImage: .init(systemName: "cart.fill")
        )
        let presenter = CatalogPresenter()
        presenter.coordinator = CatalogCoordinator.shared
        controller.presenter = presenter
        presenter.view = controller
        let navigationController = UINavigationController(rootViewController: controller)
        return navigationController
    }

    private func profile() -> UIViewController {
        let controller: ProfileViewController = storyboard.instantiateViewController(identifier: "ProfileViewController")
        controller.tabBarItem = .init(
            title: "Profile",
            image: .init(systemName: "person.circle"),
            selectedImage: .init(systemName: "person.circle.fill")
        )
        return controller
    }
}

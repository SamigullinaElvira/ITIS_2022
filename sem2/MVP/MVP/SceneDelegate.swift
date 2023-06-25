//
//  SceneDelegate.swift
//  MVP
//
//  Created by Эльвира Самигуллина on 11.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: scene)
        self.window = window
        window.rootViewController = CompositionalLayoutController()
        window.makeKeyAndVisible()
    }
}

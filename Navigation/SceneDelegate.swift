//
//  SceneDelegate.swift
//  Navigation
//
//  Created by mitr on 03.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        let mainCoordinator = MainCoordinator()
        window?.rootViewController = mainCoordinator.start()
        window?.makeKeyAndVisible()
    }
}

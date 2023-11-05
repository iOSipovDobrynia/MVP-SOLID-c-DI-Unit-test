//
//  SceneDelegate.swift
//  mvpSOLID
//
//  Created by Goodwasp on 05.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let mainVC = ModuleBuilder.createMainModule()
        let navigationBar = UINavigationController(rootViewController: mainVC)
        
        window?.rootViewController = navigationBar
        window?.makeKeyAndVisible()
    }
}


//
//  SceneDelegate.swift
//  YeoJeong
//
//  Created by LeeJiSoo on 2022/09/09.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windonScene = (scene as? UIWindowScene) else {return}
               window = UIWindow(windowScene: windonScene)
               let rootVC = MainView()
               let navVC = UINavigationController(rootViewController: rootVC)
               self.window?.rootViewController = navVC
               window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}

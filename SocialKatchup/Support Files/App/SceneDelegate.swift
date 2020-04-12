//
//  SceneDelegate.swift
//  SocialKetchup
//
//  Created by Ivan Fomenko on 06.02.2020.
//  Copyright © 2020 com.ivanfomenko.social. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
 
        self.setDefaultAppereance()
        
        let loginViewModel = LoginViewModel()
        let registerViewModel = RegisterViewModel()
        let contentView = RootView().environmentObject(loginViewModel).environmentObject(registerViewModel)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene{
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = HostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
    
    private func setDefaultAppereance() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().clipsToBounds = true
    }
    
    
}


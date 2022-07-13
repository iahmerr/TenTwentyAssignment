//
//  SceneDelegate.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 12/07/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = TabbarModuleBuilder().createView()
        window?.makeKeyAndVisible()
        
    }
}


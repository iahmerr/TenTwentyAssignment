//
//  TabBarModuleBuilder.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 13/07/2022.
//

import Foundation
import UIKit

protocol TabbarModuleBuilding {
    func createView()-> UITabBarController
}

final class TabbarModuleBuilder: TabbarModuleBuilding {
    func createView() -> UITabBarController {
        let tabbar = TabBarViewController()
        let vc1 = DashboardhModuleBuilder().createView()
        let vc2 = WatchTabModuleBuilder().createView()
        
        tabbar.tabBar.backgroundColor = UIColor.appColor(ofType: .tabbarBackgroundColor)
        tabbar.tabBar.tintColor = .white
        tabbar.setViewControllers([vc1, vc2], animated: true)
        return tabbar
    }
}

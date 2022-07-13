//
//  TabBarViewController.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 13/07/2022.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 95
        tabBar.frame.origin.y = view.frame.height - 95
    }
}

fileprivate extension TabBarViewController {
     func setupTabbar() {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.barStyle = .black
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
         
         UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: AppFontName.light.rawValue, size: 13) as Any], for: .normal)
    }
}

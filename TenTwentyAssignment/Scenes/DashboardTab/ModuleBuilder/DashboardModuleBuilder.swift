//
//  DashboardModuleBuilder.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 13/07/2022.
//

import Foundation
import UIKit

protocol DashboardModuleBuilding: AnyObject {
    func createView() -> UIViewController
}

final class DashboardhModuleBuilder: DashboardModuleBuilding {
    
    func createView() -> UIViewController {
        let viewModel: DashboardViewModelType = DashboardViewModel(networkService: ApiService())
        let viewController = DashboardViewController(viewModel: viewModel, router: DashboardRouter())
        viewController.title = "Dashboard"
        viewController.tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage(named: "icon-dashboard"), tag: 0)
        let nav = UINavigationControllerFactory.createTransparentNavigationController(rootViewController: viewController)
        return nav
    }
}

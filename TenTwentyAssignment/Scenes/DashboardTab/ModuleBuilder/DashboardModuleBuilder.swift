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
        let viewModel: DashboardViewModelType = DashboardViewModel()
        let viewController = DashboardViewController(viewModel: viewModel)
        viewController.title = "Dashboard"
        return viewController
    }
}

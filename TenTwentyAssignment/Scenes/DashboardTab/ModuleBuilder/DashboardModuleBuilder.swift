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
        let viewController = DashboardViewController()
        viewController.title = "Dashboard"
        return viewController
    }
}

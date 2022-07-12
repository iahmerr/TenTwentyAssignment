//
//  WatchTabModuleBuilder.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 13/07/2022.
//

import Foundation
import UIKit

protocol WatchTabModuleBuilding: AnyObject {
    func createView() -> UIViewController
}

final class WatchTabModuleBuilder: WatchTabModuleBuilding {
    
    func createView() -> UIViewController {
        let viewController = WatchViewController()
        viewController.title = "Watch"
        return viewController
    }
}

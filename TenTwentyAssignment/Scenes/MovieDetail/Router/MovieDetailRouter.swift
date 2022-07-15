//
//  MovieDetailRouter.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import Foundation
import UIKit

protocol MovieDetailRouting: AnyObject {
    func pop(nav: UINavigationController)
}

final class MovieDetailRouter: MovieDetailRouting {
 
    func pop(nav: UINavigationController) {
        nav.popViewController(animated: true)
    }
    
}

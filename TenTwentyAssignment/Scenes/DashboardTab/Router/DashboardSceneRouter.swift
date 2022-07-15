//
//  DashboardSceneRouter.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import Foundation
import UIKit

protocol DashboardRouting: AnyObject {
    func navigateToDetails(data: MovieList, navigationController: UINavigationController)
}

final class DashboardRouter: DashboardRouting {
    
    func navigateToDetails(data: MovieList, navigationController: UINavigationController) {
        let viewModel = MovieDetailViewModel(movieData: data)
        let viewController = MovieDetailViewController(viewModel: viewModel, router: MovieDetailRouter())
        navigationController.pushViewController(viewController, animated: true)
    }
}

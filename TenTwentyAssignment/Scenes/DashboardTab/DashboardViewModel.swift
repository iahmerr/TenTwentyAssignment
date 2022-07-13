//
//  DashboardViewModel.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 13/07/2022.
//

import Foundation

protocol DashboardViewModelInput {
    
}

protocol DashboardViewModelOutput {
    
}

protocol DashboardViewModelType {
    var inputs: DashboardViewModelInput { get }
    var outputs: DashboardViewModelOutput { get }
}

class DashboardViewModel: DashboardViewModelInput, DashboardViewModelOutput, DashboardViewModelType {
    
    var inputs: DashboardViewModelInput { return self }
    var outputs: DashboardViewModelOutput { return self }
    
    private let networkService: MoviesService
    init(networkService: MoviesService) {
        self.networkService = networkService
    }
}

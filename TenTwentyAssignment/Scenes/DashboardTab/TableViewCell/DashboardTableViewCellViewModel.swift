//
//  DashboardTableViewCellViewModel.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 14/07/2022.
//

import Foundation


protocol DashboardTableViewCellViewModelInput {
    
}

protocol DashboardTableViewCellViewModelOutput {
    
}

protocol DashboardTableViewCellViewModelType {
    
}

final class DashboardTableViewCellViewModel: ReusableTableViewCellViewModelType, DashboardTableViewCellViewModelInput, DashboardTableViewCellViewModelOutput, DashboardTableViewCellViewModelType {
    
    var reusableIdentifier: String { DashboardTableViewCell.reuseIdentifier }
    
    init(moviesData: MovieList) {
        
    }
}

//
//  MovieOverviewTableViewCellViewModel.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import Foundation
import RxSwift

protocol MovieOverviewTableViewCellViewModelInput {
    
}

protocol MovieOverviewTableViewCellViewModelOutput {
    var overViewText: Observable<String> { get }
}

protocol MovieOverviewTableViewCellViewModelType {
    var inputs: MovieOverviewTableViewCellViewModelInput { get }
    var outputs: MovieOverviewTableViewCellViewModelOutput { get }
}

final class MovieOverviewTableViewCellViewModel: MovieOverviewTableViewCellViewModelInput, MovieOverviewTableViewCellViewModelOutput, MovieOverviewTableViewCellViewModelType, ReusableTableViewCellViewModelType {

    var reusableIdentifier: String { MovieOverviewTableViewCell.reuseIdentifier }
    var inputs: MovieOverviewTableViewCellViewModelInput { self }
    var outputs: MovieOverviewTableViewCellViewModelOutput { self }
    
    //MARK: outputs
    var overViewText: Observable<String> { overViewTextSubject }
    
    //MARK: Subject
    private let overViewTextSubject: BehaviorSubject<String>
    
    init(overview: String) {
        overViewTextSubject = BehaviorSubject<String>(value: overview)
    }
}

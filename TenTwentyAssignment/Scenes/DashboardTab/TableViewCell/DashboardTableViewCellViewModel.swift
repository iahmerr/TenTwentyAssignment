//
//  DashboardTableViewCellViewModel.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 14/07/2022.
//

import Foundation
import RxSwift


protocol DashboardTableViewCellViewModelInput {
    
}

protocol DashboardTableViewCellViewModelOutput {
    var labelText: Observable<String> { get }
    var backgroundImage: Observable<ImageWithURL> { get }
}

protocol DashboardTableViewCellViewModelType {
    var inputs: DashboardTableViewCellViewModelInput { get }
    var outputs: DashboardTableViewCellViewModelOutput { get }
}

final class DashboardTableViewCellViewModel: ReusableTableViewCellViewModelType, DashboardTableViewCellViewModelInput, DashboardTableViewCellViewModelOutput, DashboardTableViewCellViewModelType {
    
    var inputs: DashboardTableViewCellViewModelInput { self }
    var outputs: DashboardTableViewCellViewModelOutput { self }
    
    var reusableIdentifier: String { DashboardTableViewCell.reuseIdentifier }
    
    //MARK: Outputs
    var labelText: Observable<String> { labelTextSubject }
    var backgroundImage: Observable<ImageWithURL> { backgroundImageSubject }
    
    //MARK: Subjects
    private let labelTextSubject = BehaviorSubject<String>(value: "")
    private let backgroundImageSubject = BehaviorSubject<ImageWithURL>(value: ImageWithURL(nil, nil))
    
    init(moviesData: MovieList) {
        labelTextSubject.onNext(moviesData.title)
        backgroundImageSubject.onNext(moviesData.posterWithUrl)
    }
}

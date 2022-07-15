//
//  MovieDetailViewModel.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import Foundation
import RxSwift

protocol MovieDetailViewModelInput {
    
}

protocol MovieDetailViewModelOutput {
    func numberOfRows(for section: Int)-> Int
    func getCellViewModel(for index: Int)-> ReusableTableViewCellViewModelType
    var reloadTableView: Observable<Void> { get }
}

protocol MovieDetailViewModelType {
    var inputs: MovieDetailViewModelInput { get }
    var outputs: MovieDetailViewModelOutput { get }
}

final class MovieDetailViewModel: MovieDetailViewModelInput, MovieDetailViewModelOutput, MovieDetailViewModelType  {
    
    var inputs: MovieDetailViewModelInput { self }
    var outputs: MovieDetailViewModelOutput { self }
    
    //MARK: Outputs
    var reloadTableView: Observable<Void> { reloadTableViewSubject }
    
    //MARK: Subjects
    private let reloadTableViewSubject = PublishSubject<Void>()
    
    //MARK: variables
    private var cellViewModels: [ReusableTableViewCellViewModelType] = []
    private let disposeBag = DisposeBag()
    
    init(movieData: MovieList) {
        createCellViewModels(movieData: movieData)
    }
    
    func createCellViewModels(movieData: MovieList) {
        let imageCellVm = HeaderImageTableViewCellViewModel(image: movieData.posterWithUrl)
        let genreCellVM = MovieGenreTableViewCellViewModel()
        let overViewCellVM = MovieOverviewTableViewCellViewModel(overview: movieData.overview)
        cellViewModels.append(imageCellVm)
        cellViewModels.append(genreCellVM)
        cellViewModels.append(overViewCellVM)
        reloadTableViewSubject.onNext(())
    }
    
}

extension MovieDetailViewModel {
    
    func numberOfRows(for section: Int) -> Int {
        return cellViewModels.count
    }
    
    func getCellViewModel(for index: Int) -> ReusableTableViewCellViewModelType {
        return cellViewModels[index]
    }
}

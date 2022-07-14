//
//  DashboardViewModel.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 13/07/2022.
//

import Foundation
import RxSwift
import RxDataSources

protocol DashboardViewModelInput {
    
}

protocol DashboardViewModelOutput {
    var dataSource: Observable<[SectionModel<Int, ReusableTableViewCellViewModelType>]> { get }
}

protocol DashboardViewModelType {
    var inputs: DashboardViewModelInput { get }
    var outputs: DashboardViewModelOutput { get }
}

class DashboardViewModel: DashboardViewModelInput, DashboardViewModelOutput, DashboardViewModelType {
    
    var inputs: DashboardViewModelInput { return self }
    var outputs: DashboardViewModelOutput { return self }
    
    //MARK: outputs
    var dataSource: Observable<[SectionModel<Int, ReusableTableViewCellViewModelType>]> { return dataSourceSubject }
    
    
    //MARK: Subjects
    private let dataSourceSubject = BehaviorSubject<[SectionModel<Int, ReusableTableViewCellViewModelType>]>(value: [])
    
    //MARK: Variables
    private var page: Int = 1
    private var moviesResponse: [MovieList] = []
    
    private let networkService: MoviesService
    init(networkService: MoviesService) {
        self.networkService = networkService
        fetchMoviesData()
    }
}

fileprivate extension DashboardViewModel {
    
    func fetchMoviesData() {
        networkService.searchMoviesList(query: "\(page)") {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.createCellViewModels(result: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func createCellViewModels(result: MoviesResponse) {
        self.moviesResponse.append(contentsOf: result.results)
        let cellViewModels = result.results.map { DashboardTableViewCellViewModel(moviesData: $0) }
        dataSourceSubject.onNext([SectionModel(model: 0, items: cellViewModels)])
    }
    
}

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
    var bringNewData: AnyObserver<Void> { get }
}

protocol DashboardViewModelOutput {
    func getCellViewModel(for indexPath: Int)->DashboardTableViewCellViewModel
    func numberOfCells(for section: Int)-> Int
    var reloadTableView: Observable<Void> { get }
    func getDetails(for index: Int)-> MovieList
}

protocol DashboardViewModelType {
    var inputs: DashboardViewModelInput { get }
    var outputs: DashboardViewModelOutput { get }
}

final class DashboardViewModel: DashboardViewModelInput, DashboardViewModelOutput, DashboardViewModelType {
    
    var inputs: DashboardViewModelInput { return self }
    var outputs: DashboardViewModelOutput { return self }
    
    //MARK: outputs
    var reloadTableView: Observable<Void> { reloadTableViewSubject }
    
    //MARK: Inputs
    var bringNewData: AnyObserver<Void> { bringNewDataSubject.asObserver() }
    
    
    //MARK: Subjects
    private let bringNewDataSubject = PublishSubject<Void>()
    private let reloadTableViewSubject = PublishSubject<Void>()
    
    //MARK: Variables
    private var page: Int = 1
    private var totalPages = 1
    private var moviesResponse: [MovieList] = []
    private let disposeBag = DisposeBag()
    private var isFetchingData: Bool = false
    private var cellViewModels: [DashboardTableViewCellViewModel] = []
    
    private let networkService: MoviesService
    init(networkService: MoviesService) {
        self.networkService = networkService
        fetchMoviesData()
        
        bringNewDataSubject.subscribe(onNext: {[weak self] _ in
            guard let self = self else { return }
            guard !self.isFetchingData && self.page <= self.totalPages else { return }
            self.page += 1
            self.fetchMoviesData()
        }).disposed(by: disposeBag)
    }
}

fileprivate extension DashboardViewModel {
    
    func fetchMoviesData() {
        isFetchingData = true
        networkService.searchMoviesList(query: "\(page)") {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.createCellViewModels(result: response)
                self.totalPages = response.totalPages ?? 1
            case .failure(let error):
                print(error.error)
                self.isFetchingData = false
            }
        }
    }
    
    func createCellViewModels(result: MoviesResponse) {
        guard let finalResult = result.results else { return }
        self.moviesResponse.append(contentsOf: finalResult)
        print(moviesResponse.count)
        self.cellViewModels.append(contentsOf:  finalResult.map { DashboardTableViewCellViewModel(moviesData: $0) })
        isFetchingData = false
        reloadTableViewSubject.onNext(())
    }
}

extension DashboardViewModel {
    func getCellViewModel(for indexPath: Int) -> DashboardTableViewCellViewModel {
        return cellViewModels[indexPath]
    }
    
    func numberOfCells(for section: Int) -> Int {
       return cellViewModels.count
    }
    
    func getDetails(for index: Int) -> MovieList {
        return moviesResponse[index]
    }
}

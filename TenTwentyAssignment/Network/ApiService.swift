//
//  ApiService.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 14/07/2022.
//

import Foundation

protocol MoviesService: AnyObject {
    func searchMoviesList(query: String, completion: @escaping(Result<MoviesResponse,AppError>) -> Void)
}

final class ApiService: MoviesService {
    
    private let request: ApiRequest
    init(request: ApiRequest = APIClient()){
        self.request = request
    }
    
    func searchMoviesList(query: String, completion: @escaping(Result<MoviesResponse,AppError>) -> Void){
        let queryItems: [String : String] = ["api_key": "a8e1b456f003c5b5f64d2108ac8f34b1", "page": query]
        let router: URLRequestConvertible = Endpoint(route: .getMoviesList, method: .get, queryItems: queryItems)
        self.request.performRequest(router: router){ (result: Result<MoviesResponse, AppError>) in
            switch result{
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
}

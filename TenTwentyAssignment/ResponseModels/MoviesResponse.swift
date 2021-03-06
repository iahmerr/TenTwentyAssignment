//
//  MoviesResponse.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 14/07/2022.
//

import Foundation
import UIKit

struct MoviesResponse: Codable {
    let dates: Dates?
    let page: Int?
    let results: [MovieList]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String
}

// MARK: - Result
struct MovieList: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    private let imageBaseURL = URL(string: "https://image.tmdb.org/t/p/w500")!
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    
    
    var posterWithUrl: ImageWithURL {
        guard let posterPath = posterPath else {
            return ( nil, UIImage(named: "placeholder_icon"))
        }
        return ((imageBaseURL.absoluteString + posterPath),nil)
    }
    
    var backdropWithURL: ImageWithURL {
        guard let backdropPath = backdropPath else {
            return ( nil, UIImage(named: "placeholder_icon"))
        }
       return ((imageBaseURL.absoluteString + backdropPath),nil)
    }
}

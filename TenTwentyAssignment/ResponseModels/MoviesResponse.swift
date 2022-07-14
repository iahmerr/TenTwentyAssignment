//
//  MoviesResponse.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 14/07/2022.
//

import Foundation

struct MoviesResponse: Codable {
    let dates: Dates
    let page: Int
    let results: [MovieList]
    let totalPages, totalResults: Int

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
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
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
        ("\(imageBaseURL)\(posterPath)", nil)
    }
    
    var backdropWithURL: ImageWithURL {
        ("\(imageBaseURL)\(backdropPath)", nil)
    }
}
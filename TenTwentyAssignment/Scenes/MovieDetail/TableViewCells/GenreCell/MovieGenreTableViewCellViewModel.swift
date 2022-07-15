//
//  MovieGenreTableViewCellViewModel.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import Foundation

protocol MovieGenreTableViewCellViewModelInput {
    
}

protocol MovieGenreTableViewCellViewModelOutput {
    
}

protocol MovieGenreTableViewCellViewModelType {
    var inputs: MovieGenreTableViewCellViewModelInput { get }
    var outputs: MovieGenreTableViewCellViewModelOutput { get }
}

class MovieGenreTableViewCellViewModel:
    ReusableTableViewCellViewModelType, MovieGenreTableViewCellViewModelInput, MovieGenreTableViewCellViewModelOutput, MovieGenreTableViewCellViewModelType  {
    var reusableIdentifier: String { MovieGenreTableViewCell.reuseIdentifier }
    
    var inputs: MovieGenreTableViewCellViewModelInput { self }
    var outputs: MovieGenreTableViewCellViewModelOutput { self }
}

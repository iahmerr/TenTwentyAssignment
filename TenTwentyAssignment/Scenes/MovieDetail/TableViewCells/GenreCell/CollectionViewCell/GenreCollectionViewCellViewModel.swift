//
//  GenreCollectionViewCellViewModel.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import Foundation


protocol GenreCollectionViewCellViewModelInput {
    
}

protocol GenreCollectionViewCellViewModelOutput {
    
}

protocol GenreCollectionViewCellViewModelType {
    var inputs: GenreCollectionViewCellViewModelInput { get }
    var outputs: GenreCollectionViewCellViewModelOutput { get }
}

class GenreCollectionViewCellViewModel: GenreCollectionViewCellViewModelInput, GenreCollectionViewCellViewModelOutput,
                                        GenreCollectionViewCellViewModelType, ReusableCollectionViewCellViewModelType{
    
    var inputs: GenreCollectionViewCellViewModelInput { self }
    var outputs: GenreCollectionViewCellViewModelOutput { self }
    
    var reusableIdentifier: String { GenreCollectionViewCell.reuseIdentifier }
    
    init() {
    }
}

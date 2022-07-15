//
//  HeaderImageTableViewCellViewModel.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import Foundation
import RxSwift

protocol HeaderImageTableViewCellViewModelInput {
    
}

protocol HeaderImageTableViewCellViewModelOutput {
    var image: Observable<ImageWithURL> { get }
    var releaseDate: Observable<String> { get }
}

protocol HeaderImageTableViewCellViewModelType {
    var inputs: HeaderImageTableViewCellViewModelInput { get }
    var outputs: HeaderImageTableViewCellViewModelOutput { get }
}

final class HeaderImageTableViewCellViewModel: HeaderImageTableViewCellViewModelInput, HeaderImageTableViewCellViewModelOutput, HeaderImageTableViewCellViewModelType, ReusableTableViewCellViewModelType {
    
    var reusableIdentifier: String { HeaderImageTableViewCell.reuseIdentifier }
    
    var inputs: HeaderImageTableViewCellViewModelInput { self }
    var outputs: HeaderImageTableViewCellViewModelOutput { self }
    
    //MARK: outputs
    var image: Observable<ImageWithURL> { imageSubject }
    var releaseDate: Observable<String>{ releaseDateSubject }
    
    //MARK: Subjects
    private let imageSubject = BehaviorSubject<ImageWithURL>(value: (nil, nil))
    private let releaseDateSubject = BehaviorSubject<String>(value: "")
    
    init(image: ImageWithURL, releaseDate: String) {
        imageSubject.onNext(image)
        releaseDateSubject.onNext("In theaters \(releaseDate)")
    }
    
}

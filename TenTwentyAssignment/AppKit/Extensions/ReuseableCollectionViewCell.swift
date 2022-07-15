//
//  ReuseableCollectionViewCell.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import Foundation
import UIKit
import RxSwift


public protocol ReusableCollectionViewCellViewModelType {
    var reusableIdentifier: String { get }
}

public protocol ConfigurableCollectionView: AnyObject {
    func configure(with viewModel: Any)
}

public protocol ConfigurableCollectionViewCell: ConfigurableCollectionView {
    func setIndexPath(_ indexPath: IndexPath)
}

open class ReusableCollectionViewCell: UICollectionViewCell, ReusableCollectionView, ConfigurableCollectionViewCell {
    
    public var indexPath: IndexPath!
    private(set) public var disposeBag = DisposeBag()
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        self.disposeBag = DisposeBag()
    }
    
    open func configure(with viewModel: Any) {
        fatalError("Configure with viewModel must be implemented.")
    }
    
    public func setIndexPath(_ indexPath: IndexPath) {
        self.indexPath = indexPath
    }
}

// MARK: Reusable view
public protocol ReusableCollectionView: AnyObject {}

public extension ReusableCollectionView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}


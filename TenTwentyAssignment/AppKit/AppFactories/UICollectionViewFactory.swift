//
//  UICollectionViewFactory.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import Foundation
import UIKit

public final class UICollectionViewFactory {
    
    public class func createUICollectionView(scrollDirection: UICollectionView.ScrollDirection = .horizontal, showsHorizontalScrollIndicator: Bool = false, showsVerticalScrollIndicator: Bool = false)-> UICollectionView{
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = scrollDirection
        collectionView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        collectionView.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
}

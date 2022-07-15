//
//  UIButton+Extension.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 15/07/2022.
//

import Foundation
import UIKit

extension UIButton {
    
    func addImage(image: UIImage) {
        let iconImageView: UIImageView = UIImageViewFactory.createImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = image.withTintColor(.white, renderingMode: .alwaysOriginal)
        self.addSubview(iconImageView)
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: titleLabel!.leadingAnchor, constant: -8),
            iconImageView.heightAnchor.constraint(equalTo: titleLabel!.heightAnchor),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
        ])
    }
}

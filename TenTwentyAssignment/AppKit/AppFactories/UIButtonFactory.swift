//
//  UIButtonFactory.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 13/07/2022.
//

import Foundation
import UIKit

public final class UIButtonFactory {
    public class func createButton(title: String = "", backgroundImage: UIImage? = UIImage(named: ""), backgroundColor: UIColor = .clear, textColor: UIColor = .black)-> UIButton
    {
        let button = UIButton()
        button.setImage(backgroundImage, for: .normal)
        button.setTitle(title, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = backgroundColor
        button.titleLabel?.textColor = textColor
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }
}

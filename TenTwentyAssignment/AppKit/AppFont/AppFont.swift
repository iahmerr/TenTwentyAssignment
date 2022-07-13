//
//  AppFont.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 13/07/2022.
//

import Foundation
import UIKit

public enum AppTextStyle {
    case title1
    case title2
    case title3
    case large
    case regular
    case small
    case micro
    case nano
}

public enum AppFontWeight: String {
    case extraLight = "Poppins-ExtraLight"
    case thin = "Poppins-Thin"
    case light = "Poppins-Light"
    case regular = "Poppins-Regular"
    case medium = "Poppins-Medium"
    case semibold = "Poppins-SemiBold"
    case bold = "Poppins-Bold"
    case black = "Poppins-Black"
}


public extension UIFont {
    
    static func appFont(forTextStyle style: AppTextStyle, theme: AppFontTheme = AppTheme.shared.fontTheme, weight: AppFontWeight = .regular) -> UIFont {
        switch style {
        case .title1:   return .appFont(ofSize: 28.0, theme: theme)
        case .title2:   return .appFont(ofSize: 24.0, theme: theme)
        case .title3:   return .appFont(ofSize: 21.0, theme: theme)
        case .large:    return .appFont(ofSize: 18.0, theme: theme)
        case .regular:  return .appFont(ofSize: 16.0, theme: theme)
        case .small:    return .appFont(ofSize: 14.0, theme: theme)
        case .micro:    return .appFont(ofSize: 12.0, theme: theme)
        case .nano:     return .appFont(ofSize: 10.0, theme: theme)
        }
    }
    
    static func appFont(ofSize size: CGFloat = 16, weigth: AppFontWeight = .regular, theme: AppFontTheme = AppTheme.shared.fontTheme) -> UIFont {
        return UIFont(name: weigth.rawValue, size: size)!
    }
    
    static var title1: UIFont {
        return appFont(forTextStyle: .title1)
    }
    
    static var title2: UIFont {
        return appFont(forTextStyle: .title2)
    }
    
    static var title3: UIFont {
        return appFont(forTextStyle: .title3)
    }
    
    static var large: UIFont {
        return appFont(forTextStyle: .large)
    }
    
    static var regular: UIFont {
        return appFont(forTextStyle: .regular)
    }
    
    static var small: UIFont {
        return appFont(forTextStyle: .small)
    }
    
    static var micro: UIFont {
        return appFont(forTextStyle: .micro)
    }
}

//
//  Theme.swift
//  TenTwentyAssignment
//
//  Created by Ahmer Hassan on 13/07/2022.
//

import Foundation

public enum AppColorTheme {
    case tenTwentyAssignment
}

public enum AppFontTheme {
    case main
}

public class AppTheme {
    
    public static let shared = AppTheme(colorTheme: .tenTwentyAssignment, fontTheme: .main)
    
    public var colorTheme: AppColorTheme!
    public var fontTheme: AppFontTheme!
    
    private init(colorTheme: AppColorTheme, fontTheme: AppFontTheme) {
        self.colorTheme = colorTheme
        self.fontTheme = fontTheme
    }
    
    public func setThemes(colorTheme: AppColorTheme, fontTheme: AppFontTheme) {
        self.colorTheme = colorTheme
        self.fontTheme = fontTheme
    }
}

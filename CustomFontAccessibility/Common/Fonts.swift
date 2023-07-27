//
//  Fonts.swift
//  CustomFontAccessibility
//
//  Created by Pushpinder Kaur on 12/07/23.
//

import UIKit

enum Fonts: String {
    case Bold = "Nunito-Bold"
    case Regular = "Lato-Regular"
    case ExtraBold = "Nunito-ExtraBold"
    
    func ofSize(_ value: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: value) ?? UIFont.systemFont(ofSize: value)
    }
}


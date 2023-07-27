//
//  Operators.swift
//  CustomFontAccessibility
//
//  Created by Pushpinder Kaur on 12/07/23.
//
//

import UIKit
import CoreLocation

protocol OptionalType { init() }
//MARK: - EXTENSIONS
extension String: OptionalType {}
extension Int: OptionalType {}
extension Double: OptionalType {}
extension Bool: OptionalType {}
extension Float: OptionalType {}
extension CGFloat: OptionalType {}
extension CGRect: OptionalType {}
extension UIImage: OptionalType {}
extension IndexPath: OptionalType {}
extension Int64: OptionalType {}
extension Date: OptionalType {}
extension CLLocationCoordinate2D: OptionalType {}
prefix operator /

// provides shortcut to upwrap optional variables with their default value.
prefix func /<T: OptionalType>( value: T?) -> T {
  guard let validValue = value else { return T() }
  return validValue
}

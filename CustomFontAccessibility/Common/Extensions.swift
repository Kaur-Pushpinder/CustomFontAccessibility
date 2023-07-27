//
//  Extensions.swift
//  CustomFontAccessibility
//
//  Created by Pushpinder Kaur on 12/07/23.
//


import UIKit

open class DynamicLabelFont: UILabel {
    @IBInspectable open var hasFontDynamic: Bool = false {
        didSet {
            update()
        }
    }
    
    @IBInspectable open var FontSize: Int = 0 {
        didSet {
            update()
        }
    }
    @IBInspectable open var isAlreadyBold: Bool = false {
        didSet {
            update()
        }
    }
    @IBInspectable open var isExtraBold: Bool = false {
        didSet {
            update()
        }
    }
    @IBInspectable open var isLargestFont: Bool = false {
        didSet {
            update()
        }
    }
    fileprivate func update() {
        setFont(FontSize, isAlreadyBold, isExtraBold, isLargestFont)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        update()
    }
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        setFont(FontSize, isAlreadyBold, isExtraBold, isLargestFont)
    }
    
    
    func setFont(_ fsize: Int, _ isAlreadyBold: Bool, _ isExtraBold: Bool, _ isLargestFont: Bool ) {
        //        let size = fsize
        let prefFont = (UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body))
        if isLargestFont {
            let size = fsize + (Int(prefFont.pointSize))
            let hasBoldText = !UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body).fontName.hasSuffix("-Regular")
            if hasBoldText {
                
                self.font = isExtraBold ? UIFont(name: AppFontName.extraBold, size: CGFloat(size))! : UIFont(name: AppFontName.bold, size: CGFloat(size))!
            } else {
                if isAlreadyBold {
                    self.font = UIFont(name: AppFontName.bold, size: CGFloat(size))!
                } else if isExtraBold {
                    self.font = UIFont(name: AppFontName.extraBold, size: CGFloat(size))!
                } else {
                    self.font = UIFont(name: AppFontName.regular, size: CGFloat(size))!
                }
            }
            self.adjustsFontForContentSizeCategory = true
        } else{
            let size = fsize + (Int(prefFont.pointSize))
            let hasBoldText = !UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body).fontName.hasSuffix("-Regular")
            if hasBoldText {
                
                self.font = isExtraBold ? UIFont(name: AppFontName.extraBold, size: CGFloat(size))! : UIFont(name: AppFontName.bold, size: CGFloat(size))!
            } else {
                if isAlreadyBold {
                    self.font = UIFont(name: AppFontName.bold, size: CGFloat(size))!
                } else if isExtraBold {
                    self.font = UIFont(name: AppFontName.extraBold, size: CGFloat(size))!
                } else {
                    self.font = UIFont(name: AppFontName.regular, size: CGFloat(size))!
                }
            }
            self.adjustsFontForContentSizeCategory = true
        }
    
        
        //        if size > 45 {
        //            size = 28
        //        }
        //
        //
        
    }
}

extension UITextField {
func setFont(_ fsize: Int, _ isAlreadyBold: Bool, _ isExtraBold: Bool) {

        let prefFont = (UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body))
        let size = fsize + (Int(prefFont.pointSize))
        let hasBoldText = !UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body).fontName.hasSuffix("-Regular")
        if hasBoldText {
            
            self.font = isExtraBold ? UIFont(name: AppFontName.extraBold, size: CGFloat(size))! : UIFont(name: AppFontName.bold, size: CGFloat(size))!
        } else {
            if isAlreadyBold {
                self.font = UIFont(name: AppFontName.bold, size: CGFloat(size))!
            } else if isExtraBold {
                self.font = UIFont(name: AppFontName.extraBold, size: CGFloat(size))!
            } else {
                self.font = UIFont(name: AppFontName.regular, size: CGFloat(size))!
            }
        }
        self.adjustsFontForContentSizeCategory = true
    }
}
extension UIButton {
func setFont(_ fsize: Int, _ isAlreadyBold: Bool, _ isExtraBold: Bool) {

        let prefFont = (UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body))
        let size = fsize + (Int(prefFont.pointSize))
        let hasBoldText = !UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body).fontName.hasSuffix("-Regular")
        if hasBoldText {
            self.titleLabel?.font = isExtraBold ? UIFont(name: AppFontName.extraBold, size: CGFloat(size))! : UIFont(name: AppFontName.bold, size: CGFloat(size))!
        } else {
            if isAlreadyBold {
                self.titleLabel?.font = UIFont(name: AppFontName.bold, size: CGFloat(size))!
            } else if isExtraBold {
                self.titleLabel?.font = UIFont(name: AppFontName.extraBold, size: CGFloat(size))!
            } else {
                self.titleLabel?.font = UIFont(name: AppFontName.regular, size: CGFloat(size))!
            }
        }
    self.titleLabel?.adjustsFontForContentSizeCategory = true
    }
}
//MARK: - Accesibility Extensions
@IBDesignable
extension UIButton {
    @IBInspectable
    public var setAccesibilityTraitNone:Bool {
        get {
            return self.accessibilityTraits == UIAccessibilityTraits.none
        } set {
            self.accessibilityTraits = newValue ? UIAccessibilityTraits.none : UIAccessibilityTraits.button
        }
    }
    
    @IBInspectable
    public var accesibilityLabelValue:String {
        get {
            return /self.accessibilityLabel
        } set {
            self.accessibilityLabel = newValue
        }
    }
    
    @IBInspectable
    public var isAccessibilityEnabled:Bool {
        get {
            return self.isAccessibilityElement
        } set {
            self.isAccessibilityElement = newValue
        }
    }
    
    @IBInspectable
    public var accesibilityIdentifierValue:String {
        get {
            return /self.accessibilityIdentifier
        } set {
            self.accessibilityIdentifier = newValue
        }
    }
}

@IBDesignable
extension UISearchBar {
    
    
    @IBInspectable
    public var isAccessibilityEnabled:Bool {
        get {
            return self.isAccessibilityElement
        } set {
            self.isAccessibilityElement = newValue
        }
    }
    
}



@IBDesignable
extension UILabel {
    
    @IBInspectable
    public var setAccesibilityTraitNone:Bool {
        get {
            return self.accessibilityTraits == UIAccessibilityTraits.none
        } set {
            self.accessibilityTraits = newValue ? UIAccessibilityTraits.none : UIAccessibilityTraits.staticText
        }
    }
    
    @IBInspectable
    public var accesibilityLabelValue:String {
        get {
            return /self.accessibilityLabel
        } set {
            self.accessibilityLabel = newValue
        }
    }
    
    @IBInspectable
    public var isAccessibilityEnabled:Bool {
        get {
            return self.isAccessibilityElement
        } set {
            self.isAccessibilityElement = newValue
        }
    }
    
    @IBInspectable
    public var accesibilityIdentifierValue:String {
        get {
            return /self.accessibilityIdentifier
        } set {
            self.accessibilityIdentifier = newValue
        }
    }
    
}

@IBDesignable
extension UISearchBar {
    @IBInspectable
    public var accesibilityIdentifierValue:String {
        get {
            return /self.accessibilityIdentifier
        } set {
            self.accessibilityIdentifier = newValue
        }
    }
}

@IBDesignable
extension UITableView {
    @IBInspectable
    public var accesibilityIdentifierValue:String {
        get {
            return /self.accessibilityIdentifier
        } set {
            self.accessibilityIdentifier = newValue
        }
    }
}

@IBDesignable
extension UITextView {
    
    @IBInspectable
    public var accesibilityLabelValue:String {
        get {
            return /self.accessibilityLabel
        } set {
            self.accessibilityLabel = newValue
        }
    }
    
}


@IBDesignable
extension UIImageView {
    
    @IBInspectable
    public var accesibilityLabelValue:String {
        get {
            return /self.accessibilityLabel
        } set {
            self.accessibilityLabel = newValue
        }
    }
    
}
struct AppFontName {
    static let regular = "Lato-Regular"
    static let bold = "Nunito-Bold"
    static let extraBold = "Nunito-ExtraBold"
    static let italic = "Lato-Regular"
}

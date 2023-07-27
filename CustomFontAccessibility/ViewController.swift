//
//  ViewController.swift
//  CustomFontAccessibility
//
//  Created by Pushpinder Kaur on 12/07/23.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var btnDone: UIButton!
    //MARK: - UIViewcontroller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFonts()
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        configureFonts()
    }
    private func configureFonts() {
        tfEmail.setFont(16, false, false)
        btnDone.setFont(16, false, false)
    }

}


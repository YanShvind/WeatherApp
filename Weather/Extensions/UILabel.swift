//
//  UILabel.swift
//  Weather
//
//  Created by Yan Shvyndikov on 08.12.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont?, alignment: NSTextAlignment){
        self.init()
        
        self.text = text
        self.font = font
        self.textAlignment = alignment
        self.textColor = UIColor(named: "testColor")
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

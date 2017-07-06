//
//  Categories.swift
//  MZKeyboard
//
//  Created by Kevin Peng on 5/7/17.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addTopBorder(borderWidth: CGFloat, color: UIColor) {
        addSubLayer(CGRect.init(x: 0, y: 0, width: self.frame.width, height: borderWidth), color)
    }
    func addLeftBorder(borderWidth: CGFloat, color: UIColor) {
        addSubLayer(CGRect.init(x: 0, y: 0, width: borderWidth, height: self.frame.height), color)
    }
    func addBottomBorder(borderWidth: CGFloat, color: UIColor) {
        addSubLayer(CGRect.init(x: 0, y: self.frame.height - borderWidth, width: self.frame.width, height: borderWidth), color)
    }
    func addRightBorder(borderWidth: CGFloat, color: UIColor) {
        addSubLayer(CGRect.init(x: self.frame.width - borderWidth, y: 0, width: borderWidth, height: self.frame.height), color)
    }
    
    func addSubLayer(_ frame: CGRect, _ color: UIColor) {
        let layer: CALayer = CALayer.init()
        layer.frame = frame
        layer.backgroundColor = color.cgColor
        self.layer.addSublayer(layer)
    }
}

extension UIColor {
    static var borderColor: UIColor {
        get {
            return UIColor.lightGray
        }
    }
}

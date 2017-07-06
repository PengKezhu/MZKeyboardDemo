//
//  XIBFlexibleView.swift
//  MZKeyboard
//
//  Created by Kevin Peng on 5/7/17.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

@IBDesignable class XIBFlexibleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(XIBFlexibleButton.deviceOrientationDidChange), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func deviceOrientationDidChange() {
        self.setNeedsLayout()
    }
    
    @IBInspectable var aroundBorder: CGFloat = 0.0 {
        didSet {
            if aroundBorder >= 0 {
                self.topBorder = aroundBorder
                self.leftBorder = aroundBorder
                self.bottomBorder = aroundBorder
                self.rightBorder = aroundBorder
            }
        }
    }
    
    @IBInspectable var topBorder: CGFloat = 0.0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable var leftBorder: CGFloat = 0.0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable var bottomBorder: CGFloat = 0.0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable var rightBorder: CGFloat = 0.0 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addTopBorder(borderWidth: topBorder, color: UIColor.borderColor)
        addLeftBorder(borderWidth: leftBorder, color: UIColor.borderColor)
        addBottomBorder(borderWidth: bottomBorder, color: UIColor.borderColor)
        addRightBorder(borderWidth: rightBorder, color: UIColor.borderColor)
    }
}

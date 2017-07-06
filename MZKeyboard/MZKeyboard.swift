//
//  MZKeyboard.swift
//  MZKeyboard
//
//  Created by Kevin Peng on 5/7/17.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

protocol MZKeyboardDelegate: UIKeyInput {
    func clearTheInputText()
}

class MZKeyboard: UIView {
    weak var keyInputDelegate: MZKeyboardDelegate?
    var timer: Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initTimer()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initTimer() {
        timer = Timer.init(timeInterval: 0.2, repeats: true, block: { (timer) in
            if let delegate = self.keyInputDelegate {
                delegate.deleteBackward()
            }
        })
        timer?.fireDate = Date.distantFuture
        RunLoop.main.add(timer!, forMode: .defaultRunLoopMode)
    }
    
    @IBAction func numButtonClicked(_ sender: UIButton) {
        if let delegate = keyInputDelegate {
            delegate.insertText((sender.titleLabel?.text)!)
        }
    }

    @IBAction func clearButtonClicked(_ sender: UIButton) {
        if let delegate = keyInputDelegate {
            delegate.clearTheInputText()
        }
    }
    
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        if let delegate = keyInputDelegate {
            delegate.deleteBackward()
        }
    }
    
    func runTimer() {
        if let delegate = keyInputDelegate {
            delegate.deleteBackward()
        }
    }
    
    @IBAction func longPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            timer?.fireDate = Date.init(timeIntervalSinceNow: 0.3)
            timer?.fire()
        }
        
        if sender.state == .ended || sender.state == .cancelled {
            timer?.fireDate = Date.distantFuture
        }
    }
}

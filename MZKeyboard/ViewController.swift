//
//  ViewController.swift
//  MZKeyboard
//
//  Created by Kevin Peng on 5/7/17.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.size.height
    var keyboardView: MZKeyboard?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardView = Bundle.main.loadNibNamed("MZKeyboard", owner: nil, options: nil)?.first as? MZKeyboard
        keyboardView?.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_WIDTH * 0.7)
        textField.inputView = keyboardView
        keyboardView?.keyInputDelegate = self
    }
}

extension ViewController: MZKeyboardDelegate {
    func insertText(_ text: String) {
        textField.text = textField.text?.appending(text)
    }
    
    func deleteBackward() {
        let textString: NSString = NSString.init(string: textField.text!)
        var resString: String = ""
        if textString.length > 0 {
            resString = textString.substring(to: textString.length - 1)
        }
        textField.text = resString
    }
    
    var hasText: Bool {
        get {
            return (textField.text?.characters.count)! > 0
        }
    }
    
    func clearTheInputText() {
        textField.text = ""
    }
}


//
//  RoundButton.swift
//  Calculator
//
//  Created by Ahsen Bahtışen on 5.10.2022.
//

import UIKit
@IBDesignable

class RoundButton: UIButton {

    @IBInspectable var roundButton: Bool = false{
        didSet{
            if roundButton{
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton{
            layer.cornerRadius = frame.height / 2
        }
    }

}

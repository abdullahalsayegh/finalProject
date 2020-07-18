//
//  RoundButton.swift
//  الحاسبه
//
//  Created by abdullah alsayegh on 16/07/2020.
//  Copyright © 2020 abdullah alsayegh. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var roundButton:Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}

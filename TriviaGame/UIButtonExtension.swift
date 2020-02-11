//
//  UIButtonExtension.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-02-09.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        flash.autoreverses = true
        
        layer.add(flash, forKey: nil)
        
    }
}

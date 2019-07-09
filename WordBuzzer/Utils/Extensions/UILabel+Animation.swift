//
//  UILabel+Animation.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import UIKit

extension UILabel {
    func fadeIn(_ duration: TimeInterval = 0.25, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: .curveEaseIn,
                       animations: {
                        self.alpha = 1.0
                        },
                       completion: completion)
    }
    
    func fadeOut(_ duration: TimeInterval = 0.25, delay: TimeInterval = 1.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: .curveEaseIn,
                       animations: {
                        self.alpha = 0
                        },
                       completion: completion)
    }
}

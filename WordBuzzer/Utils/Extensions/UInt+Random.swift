//
//  UInt+Random.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import Foundation

extension UInt32 {
    static func random(_ max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }
}

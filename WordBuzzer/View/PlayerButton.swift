//
//  PlayerButton.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/10/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import UIKit

class PlayerButton: UIButton {
    var player: Player? {
        didSet {
            guard let _player = player else {
                isHidden = true
                return
            }
            
            isHidden = false
            setTitle("\(_player.name)", for: .normal)
        }
    }
}

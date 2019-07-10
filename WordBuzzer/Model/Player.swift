//
//  File.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import Foundation

struct Player {
    let id: Int
    var name: String
    var score: Int
    var attempt: Int
    
    init(name: String? = nil, score: Int = 0, attempt: Int = 0) {
        self.id = Int(Date.timeIntervalSinceReferenceDate)
        self.name = name ?? "Player 1"
        self.score = score
        self.attempt = attempt
    }
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.id == rhs.id
    }
}

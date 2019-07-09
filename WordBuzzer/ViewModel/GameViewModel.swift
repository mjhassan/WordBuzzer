//
//  GameViewModel.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import Foundation

class GameViewModel {
    var players: [Player]
    var words: [word]
    
    init(_ players: [Player], words: [word]) {
        assert(players.count > 0, "ERROR: no player selected. This is a system error.")
        assert(words.count > 0, "There are no wrods found to start the game")
        
        self.players = players
        self.words = words
    }
}

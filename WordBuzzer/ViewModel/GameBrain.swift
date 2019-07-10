//
//  GameEngine.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/10/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import Foundation

class GameBrain {
    private let SINGLE_PLAYER_OVER_COUNT = 3
    private let MULTI_WIN_COUNT = 10
    private var players: [Player]
    
    var gameOver: Player? {
        
        // single player game
        if players.count == 1 {
            guard let player = players.first else { return nil }
            return player.attempt == SINGLE_PLAYER_OVER_COUNT ? player:nil
        }
        // multi-player game
        else {
            return players.filter{ $0.score >= MULTI_WIN_COUNT}.first
        }
    }
    
    init(_ players: [Player]) {
        self.players = players
    }
    
    func updateScore(_ player: Player, isCorrect: Bool) {
        for idx in 0..<players.count {
            if player == players[idx] {
                players[idx].score += isCorrect ? 1:0
                players[idx].attempt += isCorrect ? 0:1
            }
        }
    }
}

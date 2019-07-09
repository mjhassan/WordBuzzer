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
    var words: [Word]
    var currentWord: Word!
    var lastWord: Word?
    
    private var timer: Timer?
    private var hardness: Double = 0
    
    init(_ players: [Player], words: [Word]) {
        assert(players.count > 0, "ERROR: no player selected. This is a system error.")
        assert(words.count > 0, "There are no wrods found to start the game")
        
        self.players = players
        self.words = words
    }
    
    func start(loadWord: (String)->Void, matchCallback: @escaping (Word?)->Void) {
        timer?.invalidate()
        timer = nil
        
        currentWord = pickWord()
        
        loadWord(currentWord.english)
        
        timer = Timer.scheduledTimer(withTimeInterval: 3.0 - hardness, repeats: true, block: { [weak self] _ in
            self?.lastWord = arc4random_uniform(5) == 0 ? self?.currentWord:self?.pickWord()
            
            matchCallback(self?.lastWord)
        })
    }
    
    private func pickWord() -> Word {
        return words[UInt32.random(words.count)]
    }
}

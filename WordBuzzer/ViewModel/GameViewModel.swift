//
//  GameViewModel.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import Foundation

class GameViewModel {
    private let brain: GameBrain
    private let players: [Player]
    private let words: [Word]
    
    private var currentWord: Word!
    private var lastWord: Word?
    
    var playerCount: Int {
        return players.count
    }
    
    var isSoloPlay: Bool {
        return playerCount == 1
    }
    
    var attemptLeft: Int {
        return brain.firstPlayerAttempt
    }
    
    var firstPlayerScore: Int {
        return brain.firstPlayerScore
    }
    
    var secondPlayerScore: Int {
        return brain.secondPlayerScore
    }
    
    private var callBack: ((Word?)->Void)?
    private var timer: Timer?
    private var hardness: Double = 0
    
    init(_ brain: GameBrain, players: [Player], words: [Word]) {
        assert(players.count > 0, "ERROR: no player selected. This is a system error.")
        assert(words.count > 0, "There are no wrods found to start the game")
        
        self.brain = brain
        self.players = players
        self.words = words
    }
    
    func start(loadWord: (String)->Void, matchCallback: @escaping (Word?)->Void) {
        currentWord = pickWord()
        
        loadWord(currentWord.english)
        
        callBack = matchCallback
        reset(matchCallback)
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    func reset(_ matchCallback: ((Word?)->Void)? = nil) {
        stop()
        timer = Timer.scheduledTimer(withTimeInterval: 3.0 - hardness, repeats: true, block: { [weak self] _ in
            self?.lastWord = arc4random_uniform(5) == 0 ? self?.currentWord:self?.pickWord()
            
            if let _a = matchCallback {
                _a(self?.lastWord)
            }
            else if let _b = self?.callBack {
                _b(self?.lastWord)
            }
        })
    }
    
    func levelUp() {
        hardness = min(hardness+0.2, 2.75)
    }
    
    func getPlayer(at index: Int) -> Player {
        return players[index]
    }
    
    func updateScore(_ player: Player?, _ toast: ((Bool)->Void)? = nil) {
        guard let player = player else { return }
        
        toast?(currentWord == lastWord)
        
        brain.updateScore(player, isCorrect: currentWord == lastWord)
    }
    
    func getWinner() -> Player? {
        return brain.gameOver
    }
    
    private func pickWord() -> Word {
        return words[UInt32.random(words.count)]
    }
}

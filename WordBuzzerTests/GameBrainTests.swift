//
//  WordBuzzerTests.swift
//  WordBuzzerTests
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import XCTest
@testable import WordBuzzer

class GameBrainTests: XCTestCase {
    private let _init_score = 0
    private let _score = 1
    private let _score_increased = 2
    
    private let max_attempt = 3
    private let attempt_descreased = 2
    private let attempt_none = 0
    
    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_firstPlayerScore() {
        let emptyBrain = GameBrain([Player]())
        XCTAssertEqual(emptyBrain.firstPlayerScore, _init_score)
        
        let deafultBarin = GameBrain([Player(), Player(name: "Test", score: Int.max)])
        XCTAssertEqual(deafultBarin.firstPlayerScore, _init_score)
        
        let brainMock = GameBrain([Player(name: "Test", score: _score)])
        XCTAssertEqual(brainMock.firstPlayerScore, _score)
    }
    
    func test_firstPlayerAttempt() {
        let emptyBrain = GameBrain([Player]())
        XCTAssertEqual(emptyBrain.firstPlayerAttempt, max_attempt)
        
        let deafultBarin = GameBrain([Player(), Player(name: "Test", score: _score, attempt: attempt_none)])
        XCTAssertEqual(deafultBarin.firstPlayerAttempt, 3)
        
        let brainMock = GameBrain([Player(name: "Test", score: _score, attempt: max_attempt)])
        XCTAssertEqual(brainMock.firstPlayerAttempt, attempt_none)
    }
    
    func test_secondPlayerScore() {
        let emptyBrain = GameBrain([Player]())
        XCTAssertEqual(emptyBrain.secondPlayerScore, _init_score)
        
        let deafultBarin = GameBrain([Player(), Player(name: "Test", score: _score, attempt: attempt_none)])
        XCTAssertEqual(deafultBarin.secondPlayerScore, _score)
        
        let brainMock = GameBrain([Player(name: "Test", score: _score, attempt: max_attempt)])
        XCTAssertEqual(brainMock.secondPlayerScore, _score)
    }

    func test_gameOver() {
        // game is not over
        let emptyBrain = GameBrain([Player]())
        XCTAssertNil(emptyBrain.gameOver)
        
        let deafultBarin = GameBrain([Player(), Player(name: "Test", score: _score, attempt: attempt_none)])
        XCTAssertNil(deafultBarin.gameOver)
        
        let brainMock = GameBrain([Player(name: "Test", score: _score, attempt: attempt_none)])
        XCTAssertNil(brainMock.gameOver)
        
        var players = [
            Player(name: "Solo", score: 1, attempt: 3)
        ]
        var _b = GameBrain(players)
        
        // solo
        XCTAssertEqual(_b.gameOver, players.first)
        
        // multi
        players.append(
            Player(name: "Multi", score: 10, attempt: 3)
        )
        
        _b = GameBrain(players)
        
        XCTAssertEqual(_b.gameOver, players.last)
    }
    
    func test_updateScore() {
        var players = [
            Player(name: "Solo", score: 0, attempt: 0)
        ]
        var _b = GameBrain(players)
        
        // solo
        _b.updateScore(players.first!, isCorrect: true)
        XCTAssertEqual(_b.firstPlayerScore, 1)
        XCTAssertEqual(_b.firstPlayerAttempt, 3)
        
        _b.updateScore(players.first!, isCorrect: false)
        XCTAssertEqual(_b.firstPlayerScore, 1)
        XCTAssertEqual(_b.firstPlayerAttempt, 2)
        
        // multi
        players.append(
            Player(name: "Multi", score: 0, attempt: 0)
        )
        _b = GameBrain(players)
        
        _b.updateScore(players.last!, isCorrect: true)
        XCTAssertEqual(_b.secondPlayerScore, 1)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

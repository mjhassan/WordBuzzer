//
//  GameViewModelTests.swift
//  WordBuzzerTests
//
//  Created by Jahid Hassan on 7/10/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import XCTest
@testable import WordBuzzer

class GameViewModelTests: XCTestCase {

    var engine: GameBrain!
    var viewModel: GameViewModel!
    
    private let players = [Player(), Player(name: "Test", score: 1, attempt: 1)]
    
    override func setUp() {
        engine = GameBrain(players)
        viewModel = GameViewModel(engine,
                                  players: players,
                                  words: [Word(english: "a", spanish: "b"),
                                          Word(english: "c", spanish: "x")])
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_playerCount() {
        XCTAssertEqual(viewModel.playerCount, 2)
    }
    
    func test_isSoloPlay() {
        XCTAssertFalse(viewModel.isSoloPlay)
    }
    
    func test_attemptLeft() {
        XCTAssertEqual(viewModel.attemptLeft, 3)
    }

    func test_start() {
        let english_words = ["a", "c"]
        let spanish_words = ["b", "x"]
        viewModel.start(loadWord: { name in
            XCTAssertTrue(english_words.contains(name))
        }) { word in
            XCTAssertNotNil(word?.spanish)
            XCTAssertTrue(spanish_words.contains((word?.spanish)!))
        }
    }
    
    func test_reset() {
        let spanish_words = ["b", "x"]
        
        viewModel.reset { word in
            XCTAssertNotNil(word?.spanish)
            XCTAssertTrue(spanish_words.contains((word?.spanish)!))
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

//
//  StartViewModelTests.swift
//  WordBuzzerTests
//
//  Created by Jahid Hassan on 7/10/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import XCTest
@testable import WordBuzzer

class StartViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_canGoForward() {
        let vm = StartViewModel()
        XCTAssertFalse(vm.canGoForward, "Player list is empty")
        
        vm.players.append(Player())
        XCTAssertFalse(vm.canGoForward, "Word list is empty")
        
        vm.words.append(Word(english: "x", spanish: "b"))
        XCTAssertTrue(vm.canGoForward)
    }
    
    func test_playerCount() {
        let vm = StartViewModel()
        XCTAssertEqual(vm.playerCount, 0)
        
        vm.players.append(Player())
        XCTAssertEqual(vm.playerCount, 1)
        
        vm.players.append(Player())
        XCTAssertEqual(vm.playerCount, 2)
    }
    
    func test_clearPlayer() {
        let vm = StartViewModel()
        
        let target = Player(name: "test", score: 1, attempt: 1)
        vm.players.append(contentsOf: [
            target,
            Player(),
            Player()
        ])
        vm.clearPlayer()
        XCTAssertEqual(vm.playerCount, 1)
        XCTAssertEqual(vm.players, [target])
    }

    func test_addPlayer() {
        let vm = StartViewModel()
        
        let target = Player(name: "test", score: 1, attempt: 1)
        vm.addPlayer(target)
        XCTAssertEqual(vm.players.first, target)
        XCTAssertEqual(vm.players.last, target)
        
        let next = Player()
        vm.addPlayer(next)
        XCTAssertEqual(vm.players.first, target)
        XCTAssertEqual(vm.players.last, next)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

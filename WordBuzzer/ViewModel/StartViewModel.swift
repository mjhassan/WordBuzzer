//
//  StartViewModel.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import Foundation

class StartViewModel {
    public var players: [Player] = [Player()]
    public var words: [Word] = [Word]()
    public var canGoForward: Bool {
        return players.count > 0 && words.count > 0
    }
    
    init() {
        loadData()
    }
    
    func getPlayer(at index: Int) -> Player {
        return players[index]
    }
    
    func removePlayer(at index: Int) {
        players.remove(at: index)
        
        if players.count == 0 {
            players.append(Player())
        }
    }
    
    func addPlayer(_ player: Player) {
        self.players.append(player)
    }
    
    private func loadData() {
        Services().fetchData { [weak self] data in
            guard let data = data else {
                if let _localData = self?.getLocalData() {
                    self?.decodeJSONData(_localData)
                }
                return
            }
            
            self?.decodeJSONData(data)
        }
    }
    
    private func getLocalData() -> Data? {
        guard let url = Bundle.main.url(forResource: "words", withExtension: ".json"),
            let data = try? Data(contentsOf: url) else {
                return nil
        }
        
        return data
    }
    
    private func decodeJSONData(_ data: Data) {
        do {
            let models = try JSONDecoder().decode([Word].self, from: data)
            self.words = models
        }
        catch _ {
            print("decoding failed, try local data")
            if let _localData = getLocalData() {
                decodeJSONData(_localData)
            }
        }
    }
}

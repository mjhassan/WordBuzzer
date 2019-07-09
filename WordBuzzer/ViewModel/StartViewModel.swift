//
//  StartViewModel.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import Foundation
import os.log
import Alamofire

class StartViewModel {
    private let urlString = "https://gist.githubusercontent.com/DroidCoder/7ac6cdb4bf5e032f4c737aaafe659b33/raw/baa9fe0d586082d85db71f346e2b039c580c5804/words.json"
    
    public var players: [Player] = [Player()]
    public var words: [word] = [word]()
    public var canGoForward: Bool {
        return players.count > 0 && words.count > 0
    }
    
    init() {
        fetchData()
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
    
    private func fetchData() {
        Alamofire.request(urlString).responseJSON { [weak self] response in
            guard let data = response.data else {
                return
            }
            
            do {
                let models = try JSONDecoder().decode([word].self, from: data)
                self?.words = models
            }
            catch let error {
                let log = "Data mapping failed. ERROR: \(error)"
                if #available(iOS 12.0, *) {
                    os_log("%@", type: .debug, log)
                } else {
                    print("\(log)")
                }
            }
        }
    }
}

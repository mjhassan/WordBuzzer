//
//  ViewController.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import UIKit
import SCLAlertView

class StartViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    
    private let segue_id = "GameStartSegue"
    private let user_key = "host_player_name_key"
    
    private lazy var viewModel: StartViewModel = {
        let vm = StartViewModel()
        return vm
    }()
    
    // MARK:- overriden methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkAndConfigPlayer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segue_id,
            let destination = segue.destination as? GameViewController {
            
            let brain = GameBrain(viewModel.players)
            destination.viewModel = GameViewModel(brain, players: viewModel.players, words: viewModel.words)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return identifier == segue_id && viewModel.canGoForward
    }
    
    // MARK: - IBActions
    @IBAction func multiPlayer(_ sender: UIButton) {
        askPlayerName { [unowned self] opponent in
            self.viewModel.addPlayer(Player(name: opponent))
            self.performSegue(withIdentifier: self.segue_id, sender: nil)
        }
    }
}

fileprivate extension StartViewController {
    func checkAndConfigPlayer() {
        if viewModel.playerCount == 0 {
            if let name = UserDefaults.standard.string(forKey: user_key) {
                self.viewModel.addPlayer(Player(name: name))
                self.setWelcomeNote(name)
                return
            }
            
            askPlayerName(false) { [unowned self] name in
                UserDefaults.standard.set(name, forKey: self.user_key)
                self.viewModel.addPlayer(Player(name: name))
                self.setWelcomeNote(name)
            }
        }
    }
    
    func setWelcomeNote(_ name: String) {
        welcomeLabel.text = "Welcome \(name)"
    }
    
    func askPlayerName(_ opponent: Bool = true, callback: @escaping (String)->Void) {
        var responder: SCLAlertViewResponder?
        
        let alert = SCLAlertView(appearance: SCLAlertView.SCLAppearance( showCloseButton: false ))
        let field = alert.addTextField("name")
        alert.addButton(opponent ? "Start":"Lemme in!") {
            guard let name = field.text, !name.isEmpty else {
                self.askPlayerName(opponent, callback: callback)
                return
            }
            
            callback(name)
        }
        
        if opponent {
            alert.addButton("Go Back", backgroundColor: .darkGray) {
                responder?.close()
            }
        }
        
         responder = alert.showEdit((opponent ? "Game On!":"Hello Babbel-er"), subTitle: "To start please enter your name: ")
    }
}

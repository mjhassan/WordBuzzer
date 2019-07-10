//
//  ViewController.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var _tableView: UITableView!
    @IBOutlet weak var editButton: UIButton!
    
    private let segue_id = "GameStartSegue"
    private let cell_id = "Cell"
    
    private lazy var viewModel: StartViewModel = {
        let vm = StartViewModel()
        return vm
    }()
    
    // MARK:- overriden methods
    override func viewDidLoad() {
        super.viewDidLoad()
        _tableView.tableFooterView = UIView()
        _tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell_id)
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
    @IBAction func addPlayer(_ sender: UIButton) {
        guard viewModel.players.count < 6 else {
            // six player game
            return
        }
    }
    
    @IBAction func removePlayer(_ sender: UIButton) {
        editButton.setTitle(!_tableView.isEditing ? "Done":"Edit", for: .normal)
        _tableView.setEditing(!_tableView.isEditing, animated: true)
    }
}

extension StartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell_id, for: indexPath)
        
        let player = viewModel.getPlayer(at: indexPath.item)
        cell.textLabel?.text = player.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.removePlayer(at: indexPath.item)
        }
    }
}

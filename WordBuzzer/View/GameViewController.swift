//
//  GameViewController.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var buzzerButtons: [UIButton]!
    @IBOutlet weak var refWordLabel: UILabel!
    @IBOutlet weak var container: UIView!
    private var displayLabel: UILabel!
    
    public var viewModel: GameViewModel?
    
    //MARK:- overriden methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        addResetAction()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func smashedBazzer(_ sender: UIButton) {
        displayLabel.isHidden = true
        addResetAction()
    }
}

fileprivate extension GameViewController {
    func configureView() {
        displayLabel = UILabel(frame: .zero)
        displayLabel.numberOfLines = 0
        displayLabel.lineBreakMode = .byWordWrapping
        displayLabel.font = UIFont.systemFont(ofSize: 22)
        container.addSubview(displayLabel)
        
        guard let playersNo = viewModel?.players.count, playersNo > 0 else {
            return
        }
        
        for idx in 0..<playersNo {
            buzzerButtons[idx].isHidden = false
        }
    }
    
    func addResetAction() {
        viewModel?.start(loadWord: { [weak self] english in
                DispatchQueue.main.async {
                    self?.refWordLabel.text = "\(english.capitalized)"
                }
            }, matchCallback: { [weak self] word in
                DispatchQueue.main.async {
                    if let spanish = word?.spanish {
                        self?.spawnRandomPosition(with: spanish)
                    }
                }
        })
    }
    
    func spawnRandomPosition(with text: String) {
        displayLabel.isHidden = false
        displayLabel.fadeOut { [weak self] _ in
            guard let _ws = self else { return }
            
            _ws.displayLabel.text = text
            
            let size = _ws.displayLabel.expectedSize(in: _ws.container.bounds.size)
            
            let _width = size.width
            let _height = size.height
            
            let dw = _ws.container.bounds.width - _width
            let dh = _ws.container.bounds.height - _height
            
            var frame: CGRect = .zero
            var isOccupied = true
            while isOccupied {
                let xOffset = CGFloat(arc4random_uniform(UInt32(dw)))
                let yOffset = CGFloat(arc4random_uniform(UInt32(dh)))
                
                frame = CGRect(x: xOffset, y: yOffset, width: _width, height: _height)
                
                isOccupied = false
                if _ws.refWordLabel.frame.intersects(frame) {
                    isOccupied = true
                }
            }
            
            if !isOccupied {
                _ws.displayLabel.frame = frame
            }
            _ws.displayLabel.fadeIn()
        }
    }
}

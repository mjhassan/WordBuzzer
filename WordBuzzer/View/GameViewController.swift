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
    
    public var viewModel: GameViewModel?
    
    //MARK:- overriden methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.start(loadWord: { [weak self] english in
                DispatchQueue.main.async {
                    self?.refWordLabel.text = "\(english.capitalized)"
                }
            }, matchCallback: { [weak self] word in
                DispatchQueue.main.async {
                    if let spanish = word?.spanish {
                        print("\(spanish.capitalized)")
                    }
                }
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

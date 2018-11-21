//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by M on 21.11.18.
//  Copyright © 2018 M. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func rockButtonTouchUpInside(_ sender: UIButton) {
        startGame(withUserChoice: .Rock)
    }
    
    @IBAction func paperButtonTouchUpInside(_ sender: UIButton) {
        startGame(withUserChoice: .Paper)
    }
    
    @IBAction func scissorsButtonTouchUpInside(_ sender: UIButton) {
        startGame(withUserChoice: .Scissors)
    }
    
    func startGame(withUserChoice weapon : Weapon) {
        let game = Game(withUserChoice: weapon)
        let result = game.start()
        print(result.rawValue)
    }
    
}



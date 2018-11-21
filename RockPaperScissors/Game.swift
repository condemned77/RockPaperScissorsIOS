//
//  Game.swift
//  RockPaperScissors
//
//  Created by M on 21.11.18.
//  Copyright © 2018 M. All rights reserved.
//

import Foundation


enum Result: String {
    case Win = "You won!"
    case Loss = "You lost, better luck next time"
    case Draw = "It's a Draw!"
}

enum Weapon : Int, CaseIterable {
    case Rock = 0
    case Paper = 1
    case Scissors = 2
    }

class Game {
    let userChoice : Weapon
    
    init(withUserChoice userChoice : Weapon) {
        self.userChoice = userChoice
    }
    
    
    
    func start() -> Result {
        let _ = chooseRandomWeapon()
        
        return .Loss
    }
    
    
    func chooseRandomWeapon() -> Weapon {
        let randomNumber = arc4random_uniform(UInt32(Weapon.allCases.count))
        return Weapon(rawValue: Int(randomNumber))!
    }
}

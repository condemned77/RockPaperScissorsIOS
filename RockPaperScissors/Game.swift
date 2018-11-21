//
//  Game.swift
//  RockPaperScissors
//
//  Created by M on 21.11.18.
//  Copyright © 2018 M. All rights reserved.
//

import Foundation

let gameRules: [(weapon : Weapon, againstWeapon: Weapon, result: Result)] = [

    (weapon: .Rock, againstWeapon: .Paper, result: .Loss),
    (weapon: .Rock, againstWeapon: .Scissors, result:  .Win),

    (weapon: .Paper, againstWeapon: .Scissors, result:  .Loss),
    (weapon: .Paper, againstWeapon: .Rock, result: .Win),

    (weapon: .Scissors, againstWeapon: .Rock, result: .Loss),
    (weapon: .Scissors, againstWeapon: .Paper, result: .Win),
    
]

enum Result : String {
    case Win = "You won!"
    case Loss = "You lost, better luck next time"
    case Draw = "It's a Draw!"
}

enum Weapon : Int, CaseIterable {
    case Rock = 0
    case Paper = 1
    case Scissors = 2
}

struct GameRecording {
    let gameResult : Result
    let userChoice : Weapon
    let computerChoice : Weapon
    
    var description : String {
        return "\(userChoice) against \(computerChoice) = \(String(describing: gameResult))"
    }
}

class Game {
    let userChoice : Weapon
    
    init(withUserChoice userChoice : Weapon) {
        self.userChoice = userChoice
    }
    
    func start() -> GameRecording {
        let computerWeapon = chooseRandomWeapon()
        let result = evaluate(userChoice: self.userChoice, against: computerWeapon)
        
        return GameRecording(gameResult: result, userChoice: self.userChoice, computerChoice: computerWeapon)
    }
    
    func evaluate(userChoice: Weapon, against computerChoice: Weapon) -> Result {
        guard userChoice != computerChoice else {
            return .Draw
        }
        var gameResult : Result!
        for (weapon, againstWeapon, result) in gameRules {
            guard weapon == userChoice else {
                continue
            }
            
            guard againstWeapon == computerChoice else {
                continue
            }
            gameResult = result
            break;
        }
        return gameResult
    }

    
    func chooseRandomWeapon() -> Weapon {
        let randomNumber = arc4random_uniform(UInt32(Weapon.allCases.count))
        return Weapon(rawValue: Int(randomNumber))!
    }
}

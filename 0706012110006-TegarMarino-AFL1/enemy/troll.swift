//
//  troll.swift
//  0706012110006-TegarMarino-AFL1
//
//  Created by Tegar Marino on 24/03/23.
//

import Foundation

class Troll: Enemy{
    
//    Inisialisasai variable troll
    var name: String = "Troll"
    var amount: Int = 1
    var health: Int = 1000
    var attack: Int = 2
    
//    Func monster attack
    func monsterAttack(attack: Int) {
        objectUser.playerHealth -= attack
    }
    
//    
    func specialSkill(used: Bool) {
        if used {
            health += 20
            print("Troll use ultimate healing, troll health is \(health)")
        } else {
            monsterAttack(attack: attack)
        }
    }
}

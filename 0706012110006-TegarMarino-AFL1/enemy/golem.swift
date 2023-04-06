//
//  golem.swift
//  0706012110006-TegarMarino-AFL1
//
//  Created by Tegar Marino on 24/03/23.
//

import Foundation

class Golem: Enemy{
    
//    Inisialisasai variable troll
    var name: String = "golem"
    var amount: Int = 1
    var health: Int = 1000
    var attack: Int = 2
    
//    Func monster attack
    func monsterAttack(attack: Int) {
        objectUser.playerHealth -= attack
    }
    
    
    func specialSkill(used: Bool) {
        if used {
            monsterAttack(attack: 20)
            print("Golem attack you with ultimate attack, your health is \(objectUser.playerHealth)")
        } else {
            monsterAttack(attack: attack)
        }
    }
}

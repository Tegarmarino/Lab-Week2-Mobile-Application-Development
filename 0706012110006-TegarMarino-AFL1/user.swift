//
//  user.swift
//  0706012110006-TegarMarino-AFL1
//
//  Created by Tegar Marino on 31/03/23.
//

import Foundation

struct User {
    
    //User variable / attributes
    var playerHealth = 100
    var playerMana = 50
    var playerHealthPotion = 5
    var playerElixir = 5
    var playerUsername: String?

    // Function basic untuk healing
    mutating func healing(){
        playerHealth += 20
        playerHealthPotion -= 1
    }

    // Function basic untuk mana regen
     mutating func manaRegen(){
        playerMana += 10
        playerElixir -= 1
    }
}

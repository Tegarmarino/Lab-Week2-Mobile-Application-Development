//
//  physicalAttack.swift
//  0706012110006-TegarMarino-AFL1
//
//  Created by Tegar Marino on 31/03/23.
//

import Foundation

class trollPhysical: Skills {
    
//    Polymorphism dari func physicalAttack
    override func physicalAttack() {
        let probability = Int.random(in: 1...20)
        
        if objectUser.playerHealth > 0  && objectTroll.health != 0{
            totalDamage = 5
            setBasicDamage(basicDamage: totalDamage)
            if probability == 1 {
                objectTroll.specialSkill(used: true)
            } else {
                objectTroll.specialSkill(used: false)
                objectTroll.health -= getBasicDamage()
                
                print("You attack troll")
                if objectUser.playerHealth <= 0 {
                    objectUser.playerHealth = 0
                    print("Your health is \(objectUser.playerHealth), you lose !!")
                    print()
                    exit(1)
                } else if objectTroll.health < 0 {
                    objectTroll.health = 0
                    print("\(objectTroll.name) health is \(objectTroll.health), you win !!")
                    print()
                    objectPS.journeyScreen()
                }
            }
        }
    }
}

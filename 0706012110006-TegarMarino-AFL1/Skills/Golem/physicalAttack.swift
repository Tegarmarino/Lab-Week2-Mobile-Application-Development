//
//  physicalAttack.swift
//  0706012110006-TegarMarino-AFL1
//
//  Created by Tegar Marino on 31/03/23.
//

import Foundation

class golemPhysical: Skills{
    
//    Polymorphism dari func physicalAttack
    override func physicalAttack() {
        let probability = Int.random(in: 1...20)
        
        if objectUser.playerHealth > 0  && objectGolem.health != 0{
            totalDamage = 5
            setBasicDamage(basicDamage: totalDamage)
            
            if probability == 1 {
                objectGolem.specialSkill(used: true)
            } else {
                objectGolem.specialSkill(used: false)
                objectGolem.health -= getBasicDamage()
                
                print("You attack golem")
                if objectUser.playerHealth <= 0 {
                    objectUser.playerHealth = 0
                    print("Your health is \(objectUser.playerHealth), you lose !!")
                    print()
                    exit(1)
                } else if objectGolem.health < 0 {
                    objectGolem.health = 0
                    print("\(objectGolem.name) health is \(objectGolem.health), you win !!")
                    print()
                    objectPS.journeyScreen()
                }
            }
        }
    }
}

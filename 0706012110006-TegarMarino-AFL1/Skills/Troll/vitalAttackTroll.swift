//
//  vitalAttack.swift
//  0706012110006-TegarMarino-AFL1
//
//  Created by Tegar Marino on 31/03/23.
//

import Foundation

class trollVital: Skills {
    
//    Polymorphism dari func vitalAttack
    override func vitalAttack() {
        let probability = Int.random(in: 1...2)
        
        if probability == 1 {
            print("Scanned !")
            if objectTroll.health != 0{
                totalDamage = 4 * 25
                setBasicDamage(basicDamage: totalDamage)
                objectTroll.health -= getBasicDamage()
                print("You attack \(objectTroll.name)")
                if objectTroll.health < 0 {
                    objectTroll.health = 0
                    print("\(objectTroll.name) health is \(objectTroll.health), you win !!")
                    print()
                    objectPS.journeyScreen()
                }
            }
        } else {
            print("Failed scan")
            if objectUser.playerHealth > 0 {
                objectUser.playerHealth -= 20
                print("You attacked by monster by 20")
                if objectUser.playerHealth <= 0 {
                    objectUser.playerHealth = 0
                    print("You lose!")
                    exit(1)
                }
            } else {
                objectUser.playerHealth = 0
                print("You lose")
                exit(1)
            }
        }
    }
}

//
//  logicalPrograms.swift
//  0706012110006-TegarMarino-AFL1
//
//  Created by Tegar Marino on 21/03/23.
//

import Foundation

class Skills{
    
//    Attribute dari class Skills yg akan diturunkan ke childnya
    var skillName: [String] = ["Physical attack", "Meteor attack", "Scan enemy vital"]
    private var basicDamage: Int = 0
    var totalDamage: Int = 0
    
//    Getter setter untuk attribute private var basicDamage
    func getBasicDamage() -> Int {
        return self.basicDamage
    }
    func setBasicDamage(basicDamage: Int){
        self.basicDamage = basicDamage
    }
    
    
//      Function basic untuk shield
    func shield(){
        if objectUser.playerMana > 10 {
            objectUser.playerMana -= 10
            print("You use your 10 MP to block enemy attack, your health now \(objectUser.playerHealth), your mana \(objectUser.playerMana)")
            if objectUser.playerMana < 0 {
                print("Your mana is \(objectUser.playerMana), you can't use shield anymore")
            }
        } else {
            print("Your mana is \(objectUser.playerMana), you can't use shield anymore")
        }
    }
    
//    func parent untuk physical attack
    func physicalAttack(){
        print("Physical attack")
    }
    
//    func parent untuk meteorAttack
    func meteorAttack(){
        print("Meteor attack")
    }
    
//    func parent untuk vitalAttack
    func vitalAttack(){
        print("Vital attack")
    }
    
//    func basicMeteorAttack
    func basicMeteorAttack(){
        objectUser.playerMana -= 15
    }
}

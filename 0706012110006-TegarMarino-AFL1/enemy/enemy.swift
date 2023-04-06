//
//  enemy.swift
//  0706012110006-TegarMarino-AFL1
//
//  Created by Tegar Marino on 24/03/23.
//

import Foundation
protocol Enemy{

//    Inisiasliasasi variable protocol
    var name: String {get}
    var amount: Int {get set}
    var health: Int {get set}
    var attack: Int {get set}
    
//    Inisialisasi func monsterAttack()
    func monsterAttack(attack: Int)
    
//    Inisialisasi func specialSkill(), func yg menyimpan skill spesial tiap monster
    func specialSkill(used: Bool)

}

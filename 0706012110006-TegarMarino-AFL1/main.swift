//
//  main.swift
//  RPG Battle
//
//  Created by Tegar Marino on 28/02/23.
//

import Foundation

//Variable
let alphabetSet = CharacterSet.letters
var input: String? = nil


//User variable
var playerHealth = 85
var playerMana = 50
var playerHealthPotion = 5
var playerManaPotion = 5
var playerUsername: String?
//physicalAttack = 5 attack
//meteor = +50 attack & -15 mana
//shield = +1 attack shield & -10 mana
//potion = +20 health
//elixir = +10 mana


//Monster variable
var monsterName: [String] = ["Troll", "Golem"]
var trollHealth = 1000
var trollAmount = 1
var golemHealth = 1000
var golemAmount = 1

//var playerSkills: [String: String] = [:]
//playerSkills["physicalAttack"] = "Blade Slice"
//playerSkills["skillOne"] = "Burning Fire"
//playerSkills["skillTwo"] = "Lava Smoke"
//playerSkills["skillThree"] = "Fire of Hell"

var playerSkills = ["physicalAttack" : "Blade Slice", "skill" : "Meteor attack", "defend" : "Shield"]

//Pemanggilan func
openingScreen()
welcomeScreen()
journeyScreen()







func openingScreen(){
    while true {
        print("""
        Welcome to the world of magic! 🧙‍♀️🧌

        You have been chosen to embark on an epic journey as young wizard on the path to becoming a master of the arcane arts. Your adventures will take you throught forests 🌲, mountain 🏔️, and dungeons 🏰, where you will face challenges, make allies and fight enemies.

        Press [return] to continue:
        """)
        input = readLine()
        if input == ""{
            break
        } else if input != ""{
            continue
        }
    }
}

func welcomeScreen(){
    while true {
        print("May I know your name, a young wizard?")
        if let input = readLine() {
            if input.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil && input != ""{
                playerUsername = input
                break
            }
        }
        print("Masukkan huruf saja, hindari space !")
    }
    
//    Menggunakan cara optional binding untuk menghilangkan Optional("")
    if let fixingOptionalValue = playerUsername{
//    Membuat let fixingOptionalValue dengan value username
//    Ini digunakan untuk memaksa username menjadi nilai yg fix dengan let, bukan nilai optional
        print("Nice to meet you \(fixingOptionalValue)")
    } else {
        print("Tidak ada")
    }
}

func journeyScreen(){
    while true {
        print("""
        From here, you can...
        [C]heck your health and stats
        [H]eal your wounds with potion

        ... or choose where you want to go

        [F]orest of Troll
        [M]ountain of Golem
        [Q]uit Game

        Your choice
        """)
        input = readLine()?.uppercased()
        
        switch input {
        case "C":
            playerStatsScreen()
        case "H":
            healWoundScreen()
        case "F":
            forestOfTrollScreen()
        case "M":
            mountainOfGolemScreen()
        case "Q":
            exit(1)
        default:
            print("Input not valid!")
        }
    }
}

func playerStatsScreen(){
    while true {
        if let fixingOptionalValue = playerUsername{
            print("Player name \(fixingOptionalValue)")
        } else {
            print("Tidak ada")
        }
        print("""
        
        HP : 100/\(playerHealth).
        MP : 50/\(playerMana)

        Magic:
        - Physical Attack, no mana requiered. Deal 5 pt of damage.
        - Meteor. Use 15pt of MP. Deal 50pt of damage
        - Shield. 10pt of MP. Block enemy's attack in 1 turn

        Items:
        - Potion x\(playerHealthPotion). Heal 20pt of your HP.
        - Eixir x\(playerManaPotion). Add 10pt of your MP.
        
        Press [return] to go back:
        """)
        input = readLine()
        if input == ""{
            break
        } else if input != ""{
            continue
        }
    }
}

func healWoundScreen(){
    while true {
        print("""
        Your health is \(playerHealth).
        You have \(playerHealthPotion) potions.
        
        Are you sure want to use 1 potion to heal wound [Y/N]
        """)
        input = readLine()?.uppercased()
        if input == "Y"{
            if playerHealthPotion > 0 {
                if playerHealth == 100 {
                    
                } else if playerHealth < 100 {
                    healing()
                    if playerHealth > 100 {
                        playerHealth = 100
                    }
                }
            } else {
                while true {
                    print("""
                    You don't have any potion left. Be carful of your next journey.
                    
                    Press [return] to go back:
                    """)
                    input = readLine()
                    if input == ""{
                        break
                    } else if input != ""{
                        continue
                    }
                }
            }
        } else if input == "N"{
            break
        } else {
            print("Wrong input !!")
        }
    }
}

func forestOfTrollScreen (){
        print("""
        As you enter the forest, you feel a sense of unease wash over you.
        Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.
        """)
    while true{
        print("""
        
        😈 Name: \(monsterName[0]) x\(trollAmount)
        😈 Health: \(trollHealth)
        
        Choose your action:
        [1] Physical Attack. No mana required. Deal 5pt of damage.
        [2] Meteor. Use 15pt of MP. Deal 50pt of damage.
        [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
        
        [4] Use potion to heal wound.
        [5] Scan enemy's vital.
        [6] Flee from battle
        
        Your choice?
        """)
        
        input = readLine()
        
        if input == "1" {
            if playerHealth > 0 && trollHealth > 0 {
                trollHealth -= 5
                playerHealth -= 2
                if let physicalAttack = playerSkills["physicalAttack"] {
                    print("You attacked monster with \(physicalAttack) by 5 damage")
                }
                print("""
                
                You attacked by monster, your health now is \(playerHealth)
                """)
            } else if playerHealth <= 0 && trollHealth > 0 {
                print("You died & you lose from battle !!!")
                exit(1)
            } else if trollHealth <= 0 && playerHealth > 0 {
                print("You win from the battle")
            } else if trollHealth <= 0 && playerHealth <= 0 {
                print("You died & the match is draw!")
                exit(1)
            }
        } else if input == "2" {
            if playerHealth > 0 && trollHealth > 0 && playerMana > 0 {
                trollHealth -= 50
                meteorAttack()
                if let skill = playerSkills["skill"]{
                    print("You attacked monster with \(skill) by 50 damage")
                }
                print("""
                
                You attacked by monster, your health now is \(playerHealth) and your mana is \(playerMana)
                """)
            } else if playerMana <= 0 {
                playerHealth -= 2
                playerMana = 0
                print("""
                You don't have mana !
                
                You attacked by monster, your health now is \(playerHealth) and your mana is \(playerMana)
                """)
            } else if playerHealth <= 0 && trollHealth > 0 {
                print("You died & you lose from battle !!!")
                exit(1)
            } else if trollHealth <= 0 && playerHealth > 0 {
                print("You win from the battle")
                break
            } else if trollHealth <= 0 && playerHealth <= 0 {
                print("You died & the match is draw!")
                exit(1)
            }
        } else if input == "3" {
            shield()
        } else if input == "4" {
            healWoundScreen()
        } else if input == "5" {
            
        } else if input == "6" {
            fleeFromBattleScreen()
            break
        }
    }
}

func mountainOfGolemScreen(){
    print("""
        As you make your way throught the rugged mountain terrain, you cal feel the child of the wind bitting at your skin. Suddenly, you hear a sound that make you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.
        """)
    while true{
        print("""
        
        😈 Name: \(monsterName[1]) x\(golemAmount)
        😈 Health : \(golemHealth)
        
        Choose your action:
        [1] Physical Attack. No mana required. Deal 5pt of damage.
        [2] Meteor. Use 15pt of MP. Deal 50pt of damage.
        [3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.
        
        [4] Use potion to heal wound.
        [5] Scan enemy's vital.
        [6] Flee from battle
                    
        Your choice?
        """)
        input = readLine()
        if input == "1" {
            if playerHealth > 0 && golemHealth > 0 {
                golemHealth -= 5
                playerHealth -= 2
                if let physicalAttack = playerSkills["physicalAttack"] {
                    print("You attacked with \(physicalAttack) physical attack monster by 5")
                }
                print("""
                
                You attacked by monster, your health now is \(playerHealth)
                """)
            } else if playerHealth <= 0 && golemHealth > 0 {
                print("You died & you lose from battle !!!")
                exit(1)
            } else if golemHealth <= 0 && playerHealth > 0 {
                print("You win from the battle")
            } else if golemHealth <= 0 && playerHealth <= 0 {
                print("You died & the match is draw!")
                exit(1)
            }
        } else if input == "2" {
            if playerHealth > 0 && golemHealth > 0 && playerMana > 0 {
                golemHealth -= 50
                meteorAttack()
                if let skill = playerSkills["skill"]{
                    print("You attacked monster with \(skill) by 50 damage")
                }
                print("""
                
                You attacked by monster, your health now is \(playerHealth) and your mana is \(playerMana)
                """)
            } else if playerMana <= 0 {
                playerHealth -= 2
                playerMana = 0
                print("""
                You don't have mana !
                
                You attacked by monster, your health now is \(playerHealth) and your mana is \(playerMana)
                """)
            } else if playerHealth <= 0 && golemHealth > 0 {
                print("You died & you lose from battle !!!")
                exit(1)
            } else if golemHealth <= 0 && playerHealth > 0 {
                print("You win from the battle")
                break
            } else if golemHealth <= 0 && playerHealth <= 0 {
                print("You died & the match is draw!")
                exit(1)
            }
        } else if input == "3" {
            shield()
        } else if input == "4" {
            healWoundScreen()
        } else if input == "5" {
            
        } else if input == "6" {
            fleeFromBattleScreen()
            break
        }
    }
}


// Calculate function
func healthHealing(healParam: Int, potionParam: Int){
    
}

func fleeFromBattleScreen(){
    while true {
        print("""
        You feel that if you don't escape soon, you won't be able to continue the fight.
        You look around frantically, searching for a way out. You sprint towards the exit your heart pounding in your chest.
        
        you're safe, for now.
        Press [return] to continue:
        """)
        
        input = readLine()
        if input == ""{
            break
        } else if input != ""{
            continue
        }
    }
}

// Battle function

func meteorAttack(){
    playerHealth -= 2
    playerMana -= 15
}

func shield(){
    print("You have 1 shield that protect from monster attack, your health now \(playerHealth)")
}

func healing(){
    playerHealth += 20
    playerHealthPotion -= 1
}

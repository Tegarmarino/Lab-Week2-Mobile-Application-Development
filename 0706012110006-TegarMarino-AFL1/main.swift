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
var playerUsername: String?
var playerHealth = 100
var playerMana = 50
var playerPotion = 100
var playerElixir = 5
//physicalAttack = 5 attack
//meteor = +50 attack & -15 mana
//shield = +1 attack shield & -10 mana
//potion = +20 health
//elixir = +10 mana


//Monster variable
var trollHealth = 1000
var golemHealth = 1000


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
            if input.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil {
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
        - Potion x\(playerPotion). Heal 20pt of your HP.
        - Eixir x\(playerElixir). Add 10pt of your MP.
        
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
        You have \(playerPotion) potions.
        
        Are you sure want to use 1 potion to heal wound [Y/N]
        """)
        input = readLine()?.uppercased()
        if input == "Y"{
            if playerPotion == nil{
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
            } else {
                if playerHealth < 100 {
                    playerHealth += 20
                    playerPotion -= 1
                    print("""
                    Your HP is now \(playerHealth)
                    You have \(playerPotion) Potion left.
                    
                    """)
                } else {
                    print("Your health is max")
                    playerHealth = 100
                }
            }
        } else if input == "N"{
            break
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
        
        😈 Name: Troll x1
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
            if playerHealth > 20 && trollHealth > 0 {
                trollHealth -= 5
                playerHealth -= 2
                print("""
                You attacked monster by 5
                
                You attacked by monster, your health now is \(playerHealth)
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
        } else if input == "2" {
            if playerHealth > 20 && trollHealth > 0 && playerMana > 0 {
                trollHealth -= 50
                playerHealth -= 2
                playerMana -= 15
                print("""
                You attacked monster by 5
                
                You attacked by monster, your health now is \(playerHealth) and your mana is \(playerMana)
                """)
            } else if playerMana <= 0 {
                playerHealth -= 2
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
            print("You have 1 shield that protect from monster attack, your health now \(playerHealth)")
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
    while true{
        print("""
        As you make your way throught the rugged mountain terrain, you cal feel the child of the wind bitting at your skin. Suddenly, you hear a sound that make you freeze in your tracks. That's when you see it - a massive, snarling Golem emerging from the shadows.
        
        😈 Name: Golem x1
        😈 Health : \(playerHealth)
        
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
            
        } else if input == "2" {
            
        } else if input == "3" {
            
        } else if input == "4" {
            
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

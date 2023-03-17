// Keyword (Memuat block - block function)
// Pemanggilan func (Membuat logic untuk pemanggilan function utama)
// Screen function (Memuat semua function yg berhubungan dengan screen / User interface)
// Troll battle function (Memuat semua function yg berhubungan dengan Logic / Program battle dengan monster troll)
// Golem battle function (Memuat semua function yg berhubungan dengan Logic / Program battle dengan monster golem)
// Basic battle function (Membuat semua function yg berhunungan dengan Logic basic battle)

import Foundation

// Tegar marino final

// Variable
let alphabetSet = CharacterSet.letters
var input: String? = nil


//User variable / attributes
var playerHealth = 100
var playerMana = 50
var playerHealthPotion = 5
var playerElixir = 5
var playerUsername: String?

//Monster variable / attributes
var monsterName: [String] = ["Troll", "Golem"]
var trollHealth = 0
var trollAmount = 1
var golemHealth = 0
var golemAmount = 1


//Pemanggilan func
openingScreen()
welcomeScreen()
journeyScreen()




// Screen function

// Function untuk opening screen
func openingScreen(){
    while true {
        print("""
        Welcome to the world of magic! 🧙‍♀️🧌

        You have been chosen to embark on an epic journey as young wizard on the path to becoming a master of the arcane arts. Your adventures will take you throught forests 🌲, mountain  🏔️, and dungeons 🏰, where you will face challenges, make allies and fight enemies.

        Press [return] to continue:
        """, terminator: "")
        input = readLine()
        if input == ""{
            break
        } else if input != ""{
            continue
        }
    }
}

// Function untuk welcome screen
func welcomeScreen(){
    while true {
        print()
        print("May I know your name, a young wizard?", terminator: " ")
        if let input = readLine() {
            if input.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil && input != ""{
                playerUsername = input
                break
            }
        }
        print("""
            
            Input only alphabet, no number and no space !
            """)
    }
    
    if let fixingOptionalValue = playerUsername{
        print("""
            
            Nice to meet you \(fixingOptionalValue)
            """)
    } else {
        print("Invalid")
    }
}

// Function untuk journey screen
func journeyScreen(){
    while true {
        print("""
        
        From here, you can...
        [C]heck your health and stats
        [H]eal your wounds with potion
        [R]egen your mana with elixir

        ... or choose where you want to go

        [F]orest of Troll
        [M]ountain of Golem
        [Q]uit Game

        Your choice:
        """, terminator: " ")
        input = readLine()?.uppercased()
        
        switch input {
        case "C":
            playerStatsScreen()
        case "H":
            healWoundScreen()
        case "R":
            manaRegenScreen()
        case "F":
            trollHealth = 1000
            forestOfTrollScreen()
        case "M":
            golemHealth = 1000
            mountainOfGolemScreen()
        case "Q":
            exit(1)
        default:
            print("Input not valid!")
        }
        
    }
}

// Function untuk player stats screen
func playerStatsScreen(){
    while true {
        if let fixingOptionalValue = playerUsername{
            print("""
                
                Player name \(fixingOptionalValue)
                """)
        } else {
            print("Invalid")
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
        - Eixir x\(playerElixir). Add 10pt of your MP.
        
        Press [return] to go back:
        """, terminator: " ")
        input = readLine()
        if input == ""{
            break
        } else if input != ""{
            continue
        }
    }
}

// Function untuk heal wound screen & disertai dengan logic untuk heal player
func healWoundScreen(){
    while true {
        print("""
        
        Your health is \(playerHealth).
        You have \(playerHealthPotion) potions.
        
        Are you sure want to use 1 potion to heal wound [Y/N]
        """, terminator: " ")
        input = readLine()?.uppercased()
        if input == "Y"{
            if playerHealthPotion > 0 {
                if playerHealth == 100 {
                    print("Health is full")
                } else if playerHealth < 100 {
                    healing()
                    if playerHealth > 100 {
                        playerHealth = 100
                    }
                }
            } else {
                while true {
                    print("""
                    
                    You don't have any potion left. Be careful of your next journey.
                    
                    Press [return] to go back:
                    """, terminator: " ")
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

// Function untuk mana regen screen & disertai untuk logic regen mana
func manaRegenScreen(){
    while true {
        print("""
        
        Your mana is \(playerMana).
        You have \(playerElixir) potions.
        
        Are you sure want to use 1 elixir to regen your mana [Y/N]
        """, terminator: " ")
        input = readLine()?.uppercased()
        if input == "Y"{
            if playerElixir > 0 {
                if playerMana == 50 {
                    print("Mana is full")
                } else if playerMana < 50 {
                    manaRegen()
                    if playerMana > 50 {
                        playerMana = 50
                    }
                }
            } else {
                while true {
                    print("""
                    
                    You don't have any elixir left. Be careful of your next journey.
                    
                    Press [return] to go back:
                    """, terminator: " ")
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

// Function untuk foresst trool screen, disini disertai logic untuk pemanggilan function-function di "Troll battle function"
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
        [5] Use elixir to regen your mana.
        [6] Scan enemy's vital.
        [7] Flee from battle.
        
        Your choice?
        """, terminator: " ")
        
        input = readLine()
        
        switch input {
        case "1":
            physicalAttackToTroll()
            print("You attack enemy with 5, your health is \(playerHealth), and enemy health is \(trollHealth)")
        case "2":
            meteorAttackToTroll()
            print("You attack enemy with 5, your health is \(playerHealth), and enemy health is \(trollHealth)")
        case "3":
            shield()
        case "4":
            healWoundScreen()
        case "5":
            manaRegenScreen()
        case "6":
            print("""
                
                Scanning...
                
                """)
            sleep(5)
            VitalAttackToTroll()
        case "7":
            print()
        default:
            print("Your input is invalid")
        }
        if input == "7" {
            fleeFromBattleScreen()
            break
        }
    }
}

// Function untuk foresst trool screen, disini disertai logic untuk pemanggilan function-function di "Golem battle function"
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
        [5] Use elixir to regen your mana.
        [6] Scan enemy's vital.
        [7] Flee from battle.
                    
        Your choice?
        """, terminator: " ")
        
        input = readLine()
        
        switch input {
        case "1":
            physicalAttackToGolem()
            print("You attack enemy with 5, your health is \(playerHealth), and enemy health is \(golemHealth)")
        case "2":
            meteorAttackToGolem()
            print("You attack enemy with 5, your health is \(playerHealth), and enemy health is \(golemHealth)")
        case "3":
            shield()
        case "4":
            healWoundScreen()
        case "5":
            manaRegenScreen()
        case "6":
            print("""
                
                Scanning...
                
                """)
            sleep(5)
            VitalAttackToGolem()
        case "7":
            print()
        default:
            print("Your input is invalid")
        }
        if input == "7" {
            fleeFromBattleScreen()
            break
        }
    }
}

// Function untuk flee from battle screen
func fleeFromBattleScreen(){
    while true {
        print("""
        
        
        You feel that if you don't escape soon, you won't be able to continue the fight.
        You look around frantically, searching for a way out. You sprint towards the exit your heart pounding in your chest.
        
        you're safe, for now.
        Press [return] to continue:
        """, terminator: " ")
        
        input = readLine()
        if input == ""{
            break
        } else if input != ""{
            continue
        }
    }
}


// Troll battle function

// Function ini memuat semua logic pemrograman untuk physical attack ke troll
func physicalAttackToTroll(){
    if playerHealth > 0  && trollHealth != 0{
        trollHealth -= 5
        enemyAttack()
        if playerHealth <= 0 {
            playerHealth = 0
            print("Your health is \(playerHealth), you lose !!")
            print()
            exit(1)
        } else if trollHealth < 0 {
            trollHealth = 0
            print("\(monsterName[0]) health is \(trollHealth), you win !!")
            print()
            journeyScreen()
        }
    }
}

// Function ini memuat semua logic pemrograman untuk meteor attack ke troll
func meteorAttackToTroll(){
    if playerMana > 15 {
        if playerHealth > 0 && trollHealth != 0 {
            trollHealth -= 50
            meteorAttack()
            enemyAttack()
            if playerHealth <= 0 {
                playerHealth = 0
                print("Your health is \(playerHealth), you lose !!")
                print()
                exit(1)
            } else if trollHealth < 0 {
                trollHealth = 0
                print("\(monsterName[0]) health is \(trollHealth), you win !!")
                print()
                journeyScreen()
            }
        }
    } else {
        print("Your mana is \(playerMana), you don't have enough mana to use this skill")
    }
}

// Function ini memuat semua logic pemrograman untuk scan enemy vital attack ke troll, saya menggunakan random untuk scanning
func VitalAttackToTroll(){
    var randomNum = Int.random(in: 1...2)
    if randomNum == 1 {
        print("Scanned !")
        if trollHealth != 0{
            trollHealth -= 30
            print("You attack \(monsterName[0]) by 30")
            if trollHealth < 0 {
                trollHealth = 0
                print("\(monsterName[0]) health is \(trollHealth), you win !!")
                print()
                journeyScreen()
            }
        }
    } else {
        print("Failed scan")
        if playerHealth > 0 {
            playerHealth -= 20
            print("You attacked by monster by 20")
            if playerHealth <= 0 {
                playerHealth = 0
                print("You lose!")
                exit(1)
            }
        } else {
            playerHealth = 0
            print("You lose")
            exit(1)
        }
    }
}



// Golem battle function

// Function ini memuat semua logic pemrograman untuk physical attack ke troll
func physicalAttackToGolem(){
    if playerHealth > 0  && golemHealth != 0{
        golemHealth -= 5
        enemyAttack()
        if playerHealth <= 0 {
            playerHealth = 0
            print("Your health is \(playerHealth), you lose !!")
            print()
            exit(1)
        } else if golemHealth < 0 {
            golemHealth = 0
            print("\(monsterName[1]) health is \(golemHealth), you win !!")
            print()
            journeyScreen()
        }
    }
}

// Function ini memuat semua logic pemrograman untuk meteor attack ke golem
func meteorAttackToGolem(){
    if playerMana > 15 {
        if playerHealth > 0 && golemHealth != 0 {
            golemHealth -= 50
            meteorAttack()
            enemyAttack()
            if playerHealth <= 0 {
                playerHealth = 0
                print("Your health is \(playerHealth), you lose !!")
                print()
                exit(1)
            } else if golemHealth < 0 {
                golemHealth = 0
                print("\(monsterName[0]) health is \(golemHealth), you win !!")
                print()
                journeyScreen()
            }
        }
    } else {
        print("Your mana is \(playerMana), you don't have enough mana to use this skill")
    }
}

// Function ini memuat semua logic pemrograman untuk scan enemy vital attack ke golem, saya menggunakan random untuk scanning
func VitalAttackToGolem(){
    var randomNum = Int.random(in: 1...2)
    if randomNum == 1 {
        print("Scanned !")
        if golemHealth != 0{
            golemHealth -= 30
            print("You attack \(monsterName[1]) by 30")
            if golemHealth < 0 {
                golemHealth = 0
                print("\(monsterName[1]) health is \(golemHealth), you win !!")
                print()
                journeyScreen()
            }
        }
    } else {
        print("Failed scan")
        if playerHealth > 0 {
            playerHealth -= 20
            print("You attacked by monster by 20")
            if playerHealth <= 0 {
                playerHealth = 0
                print("You lose!")
                exit(1)
            }
        } else {
            playerHealth = 0
            print("You lose")
            exit(1)
        }
    }
}



// Basic battle function

// Function basic attack dari meteor attack
func meteorAttack(){
    playerMana -= 15
}

// Function basic untuk shield
func shield(){
    if playerMana > 10 {
        playerMana -= 10
        print("You use your 10 MP to block enemy attack, your health now \(playerHealth), your mana \(playerMana)")
        if playerMana < 0 {
            print("Your mana is \(playerMana), you can't use shield anymore")
        }
    } else {
        print("Your mana is \(playerMana), you can't use shield anymore")
    }
    
}

// Function basic untuk healing
func healing(){
    playerHealth += 20
    playerHealthPotion -= 1
}

// Function basic untuk mana regen
func manaRegen(){
    playerMana += 10
    playerElixir -= 1
}

// Function basic untuk enemy attack
func enemyAttack(){
    playerHealth -= 2
}

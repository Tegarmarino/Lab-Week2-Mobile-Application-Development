//
//  programScreens.swift
//  0706012110006-TegarMarino-AFL1
//
//  Created by Tegar Marino on 21/03/23.
//

import Foundation

class ProgramScreens{
    
    // Variable
    let alphabetSet = CharacterSet.letters
    var input: String? = nil
    
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
                    objectUser.playerUsername = input
                    break
                }
            }
            print("""

                Input only alphabet, no number and no space !
                """)
        }

        if let fixingOptionalValue = objectUser.playerUsername{
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
                objectTroll.health = 1000
                forestOfTrollScreen()
            case "M":
                objectGolem.health = 1000
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
            if let fixingOptionalValue = objectUser.playerUsername{
                print("""

                    Player name \(fixingOptionalValue)
                    """)
            } else {
                print("Invalid")
            }
            print("""

            HP : 100/\(objectUser.playerHealth).
            MP : 50/\(objectUser.playerMana)

            Magic:
            - Physical Attack, no mana requiered. Deal 5 pt of damage.
            - Meteor. Use 15pt of MP. Deal 50pt of damage
            - Shield. 10pt of MP. Block enemy's attack in 1 turn

            Items:
            - Potion x\(objectUser.playerHealthPotion). Heal 20pt of your HP.
            - Eixir x\(objectUser.playerElixir). Add 10pt of your MP.

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

            Your health is \(objectUser.playerHealth).
            You have \(objectUser.playerHealthPotion) potions.

            Are you sure want to use 1 potion to heal wound [Y/N]
            """, terminator: " ")
            input = readLine()?.uppercased()
            if input == "Y"{
                if objectUser.playerHealthPotion > 0 {
                    if objectUser.playerHealth == 100 {
                        print("Health is full")
                    } else if objectUser.playerHealth < 100 {
                        objectUser.healing()
                        if objectUser.playerHealth > 100 {
                            objectUser.playerHealth = 100
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

            Your mana is \(objectUser.playerMana).
            You have \(objectUser.playerElixir) potions.

            Are you sure want to use 1 elixir to regen your mana [Y/N]
            """, terminator: " ")
            input = readLine()?.uppercased()
            if input == "Y"{
                if objectUser.playerElixir > 0 {
                    if objectUser.playerMana == 50 {
                        print("Mana is full")
                    } else if objectUser.playerMana < 50 {
                        objectUser.manaRegen()
                        if objectUser.playerMana > 50 {
                            objectUser.playerMana = 50
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


            😈 Name: \(objectTroll.name) x\(objectTroll.amount)
            😈 Health: \(objectTroll.health)

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
                objectTrollPhysical.physicalAttack()
            case "2":
                objectTrollMeteor.meteorAttack()
            case "3":
                objectSkills.shield()
            case "4":
                healWoundScreen()
            case "5":
                manaRegenScreen()
            case "6":
                print("""

                    Scanning...

                    """)
                sleep(5)
                objectTrollVital.vitalAttack()
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


            😈 Name: \(objectGolem.name) x\(objectGolem.amount)
            😈 Health : \(objectGolem.health)

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
                objectGolemPhysical.physicalAttack()
            case "2":
                objectGolemMeteor.meteorAttack()
            case "3":
                objectSkills.shield()
            case "4":
                healWoundScreen()
            case "5":
                manaRegenScreen()
            case "6":
                print("""

                    Scanning...

                    """)
                sleep(5)
                objectGolemVital.vitalAttack()
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
}

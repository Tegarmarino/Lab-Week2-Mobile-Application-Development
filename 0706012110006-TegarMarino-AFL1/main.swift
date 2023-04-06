// Keyword (Memuat block - block function)
// Pemanggilan func (Membuat logic untuk pemanggilan function utama)
// Screen function (Memuat semua function yg berhubungan dengan screen / User interface)
// Troll battle function (Memuat semua function yg berhubungan dengan Logic / Program battle dengan monster troll)
// Golem battle function (Memuat semua function yg berhubungan dengan Logic / Program battle dengan monster golem)
// Basic battle function (Membuat semua function yg berhunungan dengan Logic basic battle)

import Foundation

// Requirement OOP (Object Oriented Programming)
// Class [DONE]
// Struct [DONE] -> On user file
// Inheritance [DONE] -> On skills file
// Protocol [DONE] -> On enemy file
// Polymorphism [DONE] -> On Skills class func, implementation in they inheritance in troll and golem group
// Encapsulation [DONE] -> On Skills class

// Inisialisasi object
var objectGolem = Golem()
var objectTroll = Troll()
var objectSkills = Skills()
var objectUser = User()
var objectTrollPhysical = trollPhysical()
var objectTrollMeteor = trollMeteor()
var objectTrollVital = trollVital()
var objectGolemPhysical = golemPhysical()
var objectGolemMeteor = golemMeteor()
var objectGolemVital = golemVital()
var objectPS = ProgramScreens()

// Memanggil function dari objectScreens
objectPS.openingScreen()
objectPS.welcomeScreen()
objectPS.journeyScreen()

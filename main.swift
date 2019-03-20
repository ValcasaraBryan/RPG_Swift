//
//  main.swift
//  test
//
//  Created by Bryan Valcasara on 19/03/2019.
//  Copyright © 2019 Bryan Valcasara. All rights reserved.
//

import Foundation

func input() -> Int
{
    let strData = readLine()
    return Int(strData!)!
}

func input_str() -> String
{
    let strData = readLine()
    return String(strData!)
}

func coef_chance(val: Int) -> Int
{
    var tmp = val

    if tmp > 300 
    {
        tmp = Int.random(in:1...1000) < 10 ? tmp : Int.random(in:1...99)
    }
    if tmp > 89 && tmp < 100
    {
        tmp = Int.random(in:1...1000) < 100 ? tmp : Int.random(in:1...89)
    }
    if tmp > 69 && tmp < 90
    {
        tmp = Int.random(in:1...1000) < 300 ? tmp : Int.random(in:1...69)
    }
    if tmp > 50 && tmp < 70
    {
        tmp = Int.random(in:1...1000) < 500 ? tmp : Int.random(in:1...50)
    }
    return tmp
}

let Perso_1 = Personne()
let Perso_2 = Personne()
var Name: String
var Classe: Int
var take: Int
var player: Int
var tour: Int

func perso(val: Int, a: Personne, b: Personne) -> Personne
{
    if val == 1 {
        return a}
    else {
        return b}
}

for take in 1...2
{
    Classe = 0;
    print("Hello, player \(take) what's your name ?")
    Name = input_str()
    print("Good \(Name), now choise your class between :")
    perso(val: take, a: Perso_1, b: Perso_2).Nom = Name
    while Classe < 1 || Classe > 3
    {
        print("1. Archer")
        print("2. Guerrier")
        print("3. Mage")
        Classe = input()
        switch Classe
        {
            case 1:
                if take == 1 {
                    Perso_1.init_perso(val: classe_perso.Archer)}
                else if take == 2 { 
                    Perso_2.init_perso(val: classe_perso.Archer)}
            case 2:
                if take == 1 {
                    Perso_1.init_perso(val: classe_perso.Guerrier)}
                else if take == 2 { 
                    Perso_2.init_perso(val: classe_perso.Guerrier)}
            case 3:
                if take == 1 {
                    Perso_1.init_perso(val: classe_perso.Mage)}
                else if take == 2 { 
                    Perso_2.init_perso(val: classe_perso.Mage)}
            default:
                print("Bad choise")
        }
    }
    print("Good ! You start with \(perso(val: take, a: Perso_1, b: Perso_2).Vie) health's points and \(perso(val: take, a: Perso_1, b: Perso_2).Degat_arme) attack's points\n")
}
player = 1
tour = 0
print("------------------------------ A ton tour \(perso(val: player, a: Perso_1, b: Perso_2).Nom) !!!!")
while Perso_1.Vie > 0 && Perso_2.Vie > 0
{
    tour += 1
    print("\(perso(val: player, a: Perso_1, b: Perso_2).Nom)")
    print("Vie :\t\t\(perso(val: player, a: Perso_1, b: Perso_2).Vie) HP")
    print("Degat d'arme :\t\(perso(val: player, a: Perso_1, b: Perso_2).Degat_arme) ATK\n")
    print("Quel choix ?")
    print("- 1. Attaquer")
    print("- 2. Améliorer son arme")
    print("- 3. Se Soigner")
    take = 0
    while take < 1 || take > 3 
    {
        take = input()
        switch take
        {
            case 1:
                perso(val: player, a: Perso_2, b: Perso_1).attaque(val: perso(val: player, a: Perso_1, b: Perso_2).Degat_arme, chance: Int.random(in: 0...1000) < 850 ? true : false)
            case 2:
                perso(val: player, a: Perso_1, b: Perso_2).ameliorer(coef: coef_chance(val: Int.random(in: 1...50)))
            case 3:
                if perso(val: player, a: Perso_1, b: Perso_2).soigner(val: coef_chance(val: Int.random(in: 1...1000))) == false
                {
                    take = 0
                }
            default:
                print("Bad choise")
        }
    }
    player = player == 1 ? 2 : 1
    if perso(val: player, a: Perso_1, b: Perso_2).Vie > 0 
    {
        print("------------------------------ A ton tour \(perso(val: player, a: Perso_1, b: Perso_2).Nom) !!!!")
    }
    else
    {
        print("Felicitation \(perso(val: player, a: Perso_2, b: Perso_1).Nom) tu as remporter la bataille")
    }
}

//
//  Personne.swift
//  test
//
//  Created by Bryan Valcasara on 19/03/2019.
//  Copyright © 2019 Bryan Valcasara. All rights reserved.
//

import Foundation

enum classe_perso
{
    case Archer, Guerrier, Mage, null
}

class Personne
{
    var Nom = "(null)"
    var Degat_arme = 0
    var Vie = 0
    var Vie_max = 0
    var Classe_var = classe_perso.null

    func attaque (val: Int, chance: Bool)
    {
        if chance == true
        {
            print("A l'attaque ! -\(val) HP")
            Vie = Vie - val
        }
        else
        {
            print("L'ennemi a esquive")
        }
        sleep(1)
    }
    func soigner (val: Int) -> Bool
    {
        if self.Vie + val < self.Vie_max && val > 0
        {
            print("Tu recuperes +\(val) HP")
            Vie = Vie + val
            sleep(1)
            return true
        }
        else if val > 0
        {
            if self.Vie < self.Vie_max && val > 0
            {
                print("Tu recuperes \(self.Vie_max - self.Vie) HP")
                self.Vie = self.Vie_max
                sleep(1)
                return true
            }
            else
            {
                print("Vie max")
            }
            sleep(1)
            return false
        }
        else
        {
            print("La potion est tombee et s'est cassee")
            sleep(1)
            return true
        }

    }
    func ameliorer (coef: Int)
    {
        if (coef > 0)
        {
            print("J'ameliore mon arme de +\(coef) ATK")
            self.Degat_arme += coef
        }
        else
        {
            print("L'amelioration a echoue")
        }
        sleep(1)
    }
    func init_perso (val: classe_perso)
    {
        switch val
        {
            case classe_perso.Archer:
                self.Degat_arme = 30
                self.Vie = 900
                self.Vie_max = 900
                self.Classe_var = val
            case classe_perso.Guerrier:
                self.Degat_arme = 20
                self.Vie = 1000
                self.Vie_max = 1000
                self.Classe_var = val
            case classe_perso.Mage:
                self.Degat_arme = 25
                self.Vie = 800
                self.Vie_max = 800
                self.Classe_var = val
            default:
                print("Bad Choise")
        }
    }
}

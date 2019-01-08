//
//  ViewController.swift
//  Rick et Morty API
//
//  Created by seb on 04/01/2019.
//  Copyright © 2019 seb. All rights reserved.
//

import UIKit

class CharactersController: UIViewController {
    
    var pageSuivante = ""
    var personnages: [Personnage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getPerso()
    }
    
    func getPerso() {
        APIHelper().getPerso(APIHelper().urlPresonnages) { (pageSuivante, listePersos, erreurString) in
            if pageSuivante != nil {
                print(pageSuivante!)
                self.pageSuivante = pageSuivante!
            }
            if erreurString != nil {
                print(erreurString!)
            }
            if listePersos != nil {
                self.personnages.append(contentsOf: listePersos!)
                print(self.personnages.count)
            }
        }
    }

}


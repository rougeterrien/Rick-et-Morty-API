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

    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
       
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
                DispatchQueue.main.async {
                    self.collectionview.reloadData()
                }
            }
        }
    }

}

extension CharactersController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return personnages.count
    }
    
    // fonction optionnelle pour return 1
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let personnage = personnages[indexPath.item]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersoCell", for: indexPath) as? PersoCell {
            cell.setupCell(personnage)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let taille = collectionView.frame.width / 2 - 40
        return CGSize(width: taille, height: taille)
    }
    
    
    
    
}


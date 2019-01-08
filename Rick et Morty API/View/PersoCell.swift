//
//  PersoCell.swift
//  Rick et Morty API
//
//  Created by seb on 08/01/2019.
//  Copyright © 2019 seb. All rights reserved.
//

import UIKit

class PersoCell: UICollectionViewCell {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var HolderView: UIView!
    @IBOutlet weak var persoIV: UIImageView!
    
    var perso: Personnage!
    
    func setupCell(_ perso: Personnage) {
        self.perso = perso
        self.nameLbl.text = self.perso.name
        self.persoIV.download(self.perso.image)
        HolderView.layer.cornerRadius = 25
        HolderView.clipsToBounds = true
    }
    
}

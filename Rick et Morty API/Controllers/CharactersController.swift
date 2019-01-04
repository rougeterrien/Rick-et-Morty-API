//
//  ViewController.swift
//  Rick et Morty API
//
//  Created by seb on 04/01/2019.
//  Copyright © 2019 seb. All rights reserved.
//

import UIKit

class CharactersController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        APIHelper().getPerso(APIHelper().urlPresonnages)
    }


}


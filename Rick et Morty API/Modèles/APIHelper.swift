//
//  APIHelper.swift
//  Rick et Morty API
//
//  Created by seb on 04/01/2019.
//  Copyright © 2019 seb. All rights reserved.
//

import Foundation

class APIHelper {
    
    private let _baseUrl = "https://rickandmortyapi.com/api/"
    
    var urlPresonnages: String {
        return _baseUrl + "character/"
    }
    
    func getPerso(_ string: String) {
        if let url = URL(string: string) {
            //continuer
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                }
                if data != nil {
                    // convertir en JSON
                }
                print(data)
                print(response)
                print(error)
            }.resume()
        } else {
            // on arrete
            print("URL invalide")
        }
    }
    
    
}

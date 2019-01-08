//
//  APIHelper.swift
//  Rick et Morty API
//
//  Created by seb on 04/01/2019.
//  Copyright © 2019 seb. All rights reserved.
//

import Foundation

typealias ApiCompletion = (_ string: String?, _ personnages: [Personnage]?, _ errorString: String? ) -> Void

class APIHelper {
    
    private let _baseUrl = "https://rickandmortyapi.com/api/"
    
    // pour récupérer tous les personnages
    var urlPresonnages: String {
        return _baseUrl + "character/"
    }
    
    //fonction pour récupérer tous les personnages
    func getPerso(_ string: String, completion: ApiCompletion?) {
        if let url = URL(string: string) {
            //continuer
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    // print(error!.localizedDescription)
                    completion?(nil, nil, error!.localizedDescription)
                }
                if data != nil {
                    do {
                        let reponseJSON = try JSONDecoder().decode(APIResult.self, from: data!)

                        completion?(reponseJSON.info.next, reponseJSON.results, nil)
                        
                    } catch {
                        completion?(nil, nil, error.localizedDescription)
                    }
                } else {
                    completion?(nil, nil, "Aucune data dispo")
                    print("aucune data dispo")
                }
            }.resume()
        } else {
            completion?(nil, nil, "URL invalide")
        }
    }
}

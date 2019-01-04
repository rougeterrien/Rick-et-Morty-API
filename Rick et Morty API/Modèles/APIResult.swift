//
//  APIResult.swift
//  Rick et Morty API
//
//  Created by seb on 04/01/2019.
//  Copyright © 2019 seb. All rights reserved.
//

import Foundation

struct APIResult: Decodable {
    var info: Info
    var results: [Personnage]
}

struct Info: Decodable {
    var count: Int
    var pages: Int
    var next: String
    var prev: String
}

struct Personnage: Decodable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender:  String
    var origin: Origin
    var location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
    
}

struct Origin: Decodable {
    var name: String
    var url: String
}

struct Location: Decodable {
    var name: String
    var url: String
}

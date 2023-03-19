//
//  Course.swift
//  HW 3.2
//
//  Created by Игорь Солодянкин on 20.03.2023.
//

import Foundation

struct Character: Decodable {
    let name: String
    let species: String
    let gender: String
    let location: Location
    let image: String
}

struct Location: Decodable {
    let name: String
    let url: String
}

struct rickAndMortyInfo: Decodable {
    let results: [Character]
}

//
//  Course.swift
//  HW 3.2
//
//  Created by Игорь Солодянкин on 20.03.2023.
//

import Foundation

struct Starship: Decodable {
    let name: String
    let model: String
    let manufacturer: String
    let cost_in_credits: String
}

struct Character: Decodable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let eye_color: String
    let gender: String
    let starships: [String]
}

struct StarWarsCharactersInfo: Decodable {
    let results: [Character]
}

struct StarWarsStarshipInfo: Decodable {
    let results: [Starship]
}

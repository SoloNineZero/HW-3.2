//
//  Starship.swift
//  HW 3.2
//
//  Created by Игорь Солодянкин on 20.03.2023.
//

struct Starship: Decodable {
    let name: String
    let model: String
    let manufacturer: String
    let cost_in_credits: String
}

struct StarWarsStarshipInfo: Decodable {
    let results: [Starship]
}

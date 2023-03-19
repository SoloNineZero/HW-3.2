//
//  Course.swift
//  HW 3.2
//
//  Created by Игорь Солодянкин on 20.03.2023.
//

import Foundation

struct Course: Decodable {
    let name: String
    let species: String
    let gender: String
    let origin: Origin
}

struct Origin: Decodable {
    let name: String
}

struct SwiftBookInfo: Decodable {
    let results: [Course]
}

//
//  ViewController.swift
//  HW 3.2
//
//  Created by Игорь Солодянкин on 20.03.2023.
//

import UIKit

enum Link: String {
    case apiPeopleURL = "https://swapi.dev/api/people/"
    case apiStarshipURL = "https://swapi.dev/api/starships/"
}

final class MainViewController: UIViewController {
    
    @IBAction func starshipButtonPressed(_ sender: UIButton) {
        sender.pulsate()
        fetchStarship()
    }
    
    @IBAction func personButtonPressed(_ sender: UIButton) {
        sender.pulsate()
        fetchPerson()
    }
    
    
}

// MARK: - Networking
extension MainViewController {
    private func fetchPerson() {
        guard let url = URL(string: Link.apiPeopleURL.rawValue) else { return }
                
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                
                let swInfo = try decoder.decode(StarWarsCharactersInfo.self, from: data)
                for character in swInfo.results {
                    print("""
                        name: \(character.name)
                        height: \(character.height)
                        mass: \(character.mass)
                        hair color: \(character.hair_color)
                        eye color: \(character.eye_color)
                        gender: \(character.gender)

                        """)
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    private func fetchStarship() {
        guard let url = URL(string: Link.apiStarshipURL.rawValue) else { return }
                
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                
                let swInfo = try decoder.decode(StarWarsStarshipInfo.self, from: data)
                for starship in swInfo.results {
                    
                    print("""
                        name: \(starship.name)
                        model: \(starship.model)
                        manufacturer: \(starship.manufacturer)
                        cost in credits: \(starship.cost_in_credits)

                        """)
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }

}


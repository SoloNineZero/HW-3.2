//
//  ViewController.swift
//  HW 3.2
//
//  Created by Игорь Солодянкин on 20.03.2023.
//

import UIKit

final class MainViewController: UIViewController {
  
    let apiURL = "https://rickandmortyapi.com/api/character"
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        sender.pulsate()
        fetchCourses()
    }
    
}

// MARK: - Networking
extension MainViewController {
    private func fetchCourses() {
        guard let url = URL(string: apiURL) else { return }
                
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let ramInfo = try decoder.decode(rickAndMortyInfo.self, from: data)
                print(ramInfo)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}


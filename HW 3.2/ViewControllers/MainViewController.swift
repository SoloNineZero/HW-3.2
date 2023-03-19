//
//  ViewController.swift
//  HW 3.2
//
//  Created by Игорь Солодянкин on 20.03.2023.
//

import UIKit

final class MainViewController: UIViewController {
  
    enum Link: String {
        case coursesURL = "https://rickandmortyapi.com/api/character"
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        fetchCourses()
    }
    
}

// MARK: - Networking
extension MainViewController {
    private func fetchCourses() {
        guard let url = URL(string: Link.coursesURL.rawValue) else { return }
                
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let sbInfo = try decoder.decode(SwiftBookInfo.self, from: data)
                print(sbInfo)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}


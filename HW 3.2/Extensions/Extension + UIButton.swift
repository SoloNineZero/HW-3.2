//
//  Extension + UIButton.swift
//  HW 3.2
//
//  Created by Игорь Солодянкин on 20.03.2023.
//

import UIKit

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.fromValue = 0.95
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.duration = 0.5
        pulse.damping = 0.3
        
        layer.add(pulse, forKey: nil)
    }
}

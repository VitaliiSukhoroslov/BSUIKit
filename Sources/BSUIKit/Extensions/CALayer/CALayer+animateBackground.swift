//
//  CALayer+animateBackground.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import UIKit

extension CALayer {
    func animateBackground(
        isHighlighted: Bool,
        currentBackgroundColor: UIColor = UIColor.clear,
        highlightedColor: UIColor? = nil
    ) {
        let highlightedColor: UIColor = highlightedColor ?? currentBackgroundColor.withAlphaComponent(0.2)

        if isHighlighted {
            backgroundColor = highlightedColor.cgColor
            return
        }

        if backgroundColor == currentBackgroundColor.cgColor {
            return
        }

        let startColor = highlightedColor
        let endColor = currentBackgroundColor
        let duration = 0.35
        let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimation.fromValue = startColor.cgColor
        colorAnimation.toValue = endColor.cgColor
        colorAnimation.duration = duration
        self.backgroundColor = endColor.cgColor
        self.add(colorAnimation, forKey: "backgroundColor")
    }
}

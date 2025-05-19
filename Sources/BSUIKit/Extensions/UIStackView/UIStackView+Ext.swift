//
//  UIStackView+Ext.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 19.05.2025.
//

import UIKit

public extension UIStackView {
    /// Sweeter: Remove `subview` from the view hierarchy, not just the stack arrangement.
    func removeArrangedSubviewCompletely(_ subview: UIView) {
        removeArrangedSubview(subview)
        subview.removeFromSuperview()
    }

    /// Sweeter: Remove all arranged subviews from the view hierarchy, not just the stack arrangement.
    func removeAllArrangedSubviewsCompletely() {
        for subview in arrangedSubviews.reversed() {
            removeArrangedSubviewCompletely(subview)
        }
    }
}

public extension UIStackView {
    func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach {
            addArrangedSubview($0)
        }
    }
}

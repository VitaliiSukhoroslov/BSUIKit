//
//  UIView+addSubviews.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import UIKit

public extension UIView {
    func addSubviews(_ views: UIView...) {
        for v in views {
            self.addSubview(v)
        }
    }
}

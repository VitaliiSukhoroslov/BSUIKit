//
//  UIImage+Ext.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import UIKit

extension UIImage {
    convenience init(imageName: String) {
        self.init(named: imageName, in: .module, compatibleWith: nil)!
    }
}

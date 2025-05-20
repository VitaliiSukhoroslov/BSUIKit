//
//  SwitchSettings.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 20.05.2025.
//

import UIKit

public struct SwitchSettings {
    var onTintColor: UIColor?

    public init(
        onTintColor: UIColor? = nil
    ) {
        self.onTintColor = onTintColor
    }

    func setup(_ view: UISwitch) {
        if let onTintColor = onTintColor {
            view.onTintColor = onTintColor
        }
    }
}

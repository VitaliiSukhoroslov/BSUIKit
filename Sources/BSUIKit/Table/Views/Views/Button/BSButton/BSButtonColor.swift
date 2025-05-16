//
//  BSButtonColor.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import UIKit

public enum UNButtonColor {
    case white
    case clear
}

public extension UNButtonColor {
    func backgroundColor(isEnabled: Bool) -> UIColor {
        switch self {
        case .white:
            return isEnabled ? .white : .white.withAlphaComponent(0.5)
        case .clear:
            return .clear
        }
    }

    func tintColor(isEnabled: Bool) -> UIColor {
        switch self {
        case .white:
            return isEnabled ? .white : .black.withAlphaComponent(0.5)
        case .clear:
            return .clear
        }
    }

    func titleColor(for state: UIControl.State) -> UIColor {
        switch state {
        case .disabled:
            return titleColorDisabled
        case .normal:
            return titleColorNormal
        default:
            return .white
        }
    }
}

private extension UNButtonColor {
    var titleColorNormal: UIColor {
        switch self {
        case .white:
            return .black
        case .clear:
            return .clear
        }
    }

    var titleColorDisabled: UIColor {
        switch self {
        case .white:
            return .white.withAlphaComponent(0.7)
        case .clear:
            return .clear
        }
    }
}

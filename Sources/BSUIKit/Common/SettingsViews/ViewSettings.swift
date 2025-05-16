//
//  ViewSettings.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 17.05.2025.
//

import UIKit

public struct ViewSettings {
    public let backgroundColor: UIColor
    public let cornerRadius: CGFloat
    public let insets: UIEdgeInsets
    public let borderColor: UIColor
    public let borderWidth: CGFloat
    public let shadowColor: UIColor
    public let shadowOffset: CGSize
    public let shadowRadius: CGFloat
    public let shadowOpacity: Float

    public init(
        backgroundColor: UIColor = .clear,
        cornerRadius: CGFloat = 0,
        insets: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0),
        borderColor: UIColor = .clear,
        borderWidth: CGFloat = 0,
        shadowColor: UIColor = .clear,
        shadowOffset: CGSize = .zero,
        shadowRadius: CGFloat = 0,
        shadowOpacity: Float = 0
    ) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.insets = insets
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.shadowColor = shadowColor
        self.shadowOffset = shadowOffset
        self.shadowRadius = shadowRadius
        self.shadowOpacity = shadowOpacity
    }

    func setup(_ view: UIView) {
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = cornerRadius
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = borderWidth
        view.layer.shadowColor = shadowColor.cgColor
        view.layer.shadowOffset = shadowOffset
        view.layer.shadowRadius = shadowRadius
        view.layer.shadowOpacity = shadowOpacity
    }
}

//
//  ButtonSettings.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import UIKit

public struct ButtonSettings {
    public var isShowing: Bool
    public var isEnabled: Bool
    public var clipsToBounds: Bool
    public var leftImage: UIImage?
    public var leftColorImage: UIColor?
    public var leftImageOffsetY: CGFloat?
    public var title: String
    public var titleColor: UIColor
    public var titleFont: UIFont
    public var rightImage: UIImage?
    public var rightColorImage: UIColor?
    public var rightImageOffsetY: CGFloat?
    public var cornerRadius: CGFloat
    public var backgroundColor: UIColor
    public var borderColor: UIColor
    public var borderWidth: CGFloat
    public var insets: UIEdgeInsets

    public init(
        isShowing: Bool = true,
        isEnabled: Bool = true,
        clipsToBounds: Bool = true,
        leftImage: UIImage? = nil,
        leftColorImage: UIColor? = nil,
        leftImageOffsetY: CGFloat? = nil,
        title: String = "",
        titleColor: UIColor = .black,
        titleFont: UIFont = .systemFont(ofSize: 14),
        rightImage: UIImage? = nil,
        rightColorImage: UIColor? = nil,
        rightImageOffsetY: CGFloat? = nil,
        cornerRadius: CGFloat = 0,
        backgroundColor: UIColor = .clear,
        borderColor: UIColor = .clear,
        borderWidth: CGFloat = 0,
        insets: UIEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 16)
    ) {
        self.isShowing = isShowing
        self.isEnabled = isEnabled
        self.clipsToBounds = clipsToBounds
        self.leftImage = leftImage
        self.leftColorImage = leftColorImage
        self.leftImageOffsetY = leftImageOffsetY
        self.title = title
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.rightImage = rightImage
        self.rightColorImage = rightColorImage
        self.rightImageOffsetY = rightImageOffsetY
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.insets = insets
    }

    public func setup(_ button: BSButton) {
        button.isHidden = !isShowing
        button.isUserInteractionEnabled = isEnabled
        button.clipsToBounds = clipsToBounds
        button.alpha = isEnabled ? 1 : 0.3
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = titleFont
        button.layer.cornerRadius = cornerRadius
        button.backgroundColor = backgroundColor
        button.layer.borderColor = borderColor.cgColor
        button.layer.borderWidth = borderWidth

        button.textAndImageButton(
            leftImage: leftImage,
            leftColorImage: leftColorImage,
            leftImageOffsetY: leftImageOffsetY,
            title: title,
            rightImage: rightImage,
            rightColorImage: rightColorImage,
            rightImageOffsetY: rightImageOffsetY
        )
    }
}

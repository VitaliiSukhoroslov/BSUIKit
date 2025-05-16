//
//  SettingsLabel.swift
//  NFUIKit
//
//  Created by Виталий Сухорослов on 03.10.2024.
//

import UIKit

public struct LabelSettings {
    let alignment: NSTextAlignment
    let font: UIFont
    let textColor: UIColor
    let numberOfLines: Int
    let insets: UIEdgeInsets
    let attributedText: NSAttributedString?

    public init(
        alignment: NSTextAlignment = .left,
        font: UIFont = .systemFont(ofSize: 18, weight: .medium),
        textColor: UIColor = .white,
        numberOfLines: Int = 0,
        insets: UIEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 16),
        attributedText: NSAttributedString? = nil
    ) {
        self.alignment = alignment
        self.font = font
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.insets = insets
        self.attributedText = attributedText
    }

    public func setupLabel(_ label: UILabel, title: String? = nil) {
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
        label.font = font
        label.textColor = textColor

        if let attributed = attributedText {
            label.attributedText = attributed
        } else {
            label.text = title
        }
    }
}

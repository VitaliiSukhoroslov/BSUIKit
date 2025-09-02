//
//  BSButton.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import UIKit
import SnapKit

open class BSButton: ActionButton, LoadableView {

    private var bottomConstraint: Constraint?
    private var buttonColor: UNButtonColor

    private var titleFont: UIFont?

    public var loadingBackgroundColor: UIColor {
        buttonColor.backgroundColor(isEnabled: true)
    }
    public var loadingIndicatorTintColor: UIColor {
        buttonColor.tintColor(isEnabled: true)
    }

    public override init(frame: CGRect) {
        self.buttonColor = .white

        super.init(frame: frame)
        setupUI()
    }

    required public init?(coder aDecoder: NSCoder) {
        self.buttonColor = .white

        super.init(coder: aDecoder)

        setupUI()
    }

    init(frame: CGRect, color: UNButtonColor = .white) {
        self.buttonColor = color

        super.init(frame: frame)
        setupUI()
    }

    public override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)

        // Font resets after setTitle method
        setFont(titleFont)
    }

    public override var isEnabled: Bool {
        get {
            super.isEnabled
        }
        set(value) {
            super.isEnabled = value

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
                guard let self else { return }

                alpha = isEnabled ? 1.0 : 0.3
            }
        }
    }

    private func setupUI() {
        setType(color: buttonColor)

        clipsToBounds = true
        titleFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        layer.cornerRadius = 24.0
    }

    public func setBordered(color: UIColor) {
        backgroundColor = .clear
        clipsToBounds = true
        setTitleColor(.white, for: .normal)
        titleFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        layer.cornerRadius = 24.0
        layer.borderWidth = 1.0
        layer.borderColor = color.cgColor
    }

    private func setType(color: UNButtonColor) {
        buttonColor = color
        backgroundColor = color.backgroundColor(isEnabled: true)
        tintColor = color.tintColor(isEnabled: true)

        setTitleColor(color.titleColor(for: .normal), for: .normal)
        setTitleColor(color.titleColor(for: .disabled), for: .disabled)

        titleFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
}

extension BSButton {
    public func setBottomConstraint(_ constraint: Constraint?) {
        bottomConstraint = constraint
    }

    public func updateBottomConstraint(_ value: CGFloat) {
        bottomConstraint?.update(offset: -value)
    }
}

private extension BSButton {
    func setFont(_ font: UIFont?) {
        guard let font = font else { return }

        if #available(iOS 15.0, *) {
            self.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = font
                return outgoing
            }
        } else {
            self.titleLabel?.font = font
        }
    }
}

extension BSButton {
    public func textAndImageButton(
        leftImage: UIImage? = nil,
        leftColorImage: UIColor? = nil,
        leftImageOffsetY: CGFloat? = nil,
        title: String,
        rightImage: UIImage? = nil,
        rightColorImage: UIColor? = nil,
        rightImageOffsetY: CGFloat? = nil
    ) {
        let attributedString = NSMutableAttributedString()

        if let iconLeftImage = leftImage, let leftImageOffsetY {
            let iconAttachment = NSTextAttachment()
            var processedImage = iconLeftImage

            if let color = leftColorImage {
                processedImage = processedImage.withRenderingMode(.alwaysTemplate)
                iconAttachment.image = processedImage
                iconAttachment.image = iconAttachment.image?.withTintColor(color)
            } else {
                iconAttachment.image = processedImage
            }

            iconAttachment.bounds = CGRect(
                x: 0,
                y: leftImageOffsetY,
                width: iconLeftImage.size.width,
                height: iconLeftImage.size.height
            )
            attributedString.append(NSAttributedString(attachment: iconAttachment))
            attributedString.append(NSAttributedString(string: "  "))
        }

        attributedString.append(NSAttributedString(string: title))

        if let iconRightImage = rightImage, let rightImageOffsetY {
            let iconAttachment = NSTextAttachment()
            var processedImage = iconRightImage

            if let color = rightColorImage {
                processedImage = processedImage.withRenderingMode(.alwaysTemplate)
                iconAttachment.image = processedImage
                iconAttachment.image = iconAttachment.image?.withTintColor(color)
            } else {
                iconAttachment.image = processedImage
            }

            iconAttachment.bounds = CGRect(
                x: 0,
                y: rightImageOffsetY,
                width: iconRightImage.size.width,
                height: iconRightImage.size.height
            )

            attributedString.append(NSAttributedString(string: "  "))
            attributedString.append(NSAttributedString(attachment: iconAttachment))
        }

        setAttributedTitle(attributedString, for: .normal)
    }
}

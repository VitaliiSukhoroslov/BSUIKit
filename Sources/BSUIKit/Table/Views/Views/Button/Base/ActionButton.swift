//
//  ActionButton.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import UIKit

/// `ActionButton` – A customizable UIButton subclass that provides animated touch feedback
/// and closures for handling tap, long press, and touch state transitions.
///
/// This button animates scaling and alpha on touch events, and allows easy callback
/// configuration through closure properties.
open class ActionButton: UIButton {

    // MARK: - Touch Event Handlers

    /// Called when the button is pressed down (`.touchDown` or `.touchDragEnter`).
    public var touchDown: ((_ button: UIButton) -> Void)?

    /// Called when the button touch is canceled or dragged out (`.touchCancel` or `.touchDragExit`).
    public var touchExit: ((_ button: UIButton) -> Void)?

    /// Called when the touch ends inside the button (`.touchUpInside`).
    public var touchUp: ((_ button: UIButton) -> Void)?

    /// Called when a long press is detected (default duration: 1.5 seconds).
    public var touchDownLong: ((_ button: UIButton) -> Void)?

    // MARK: - Initializers

    /// Initializes the button with a given frame.
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    /// Initializes the button from a storyboard or nib.
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    // MARK: - Setup

    /// Sets up default touch targets and prepares the button for interaction.
    private func setupButton() {
        addTarget(self, action: #selector(touchDown(_:)), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(touchExit(_:)), for: [.touchCancel, .touchDragExit])
        addTarget(self, action: #selector(touchUp(_:)), for: [.touchUpInside])
    }

    /// Adds a long press gesture recognizer to the button.
    ///
    /// The default minimum press duration is `1.5` seconds.
    func addLongPressGesture() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(gesture:)))
        longPress.minimumPressDuration = 1.5
        self.addGestureRecognizer(longPress)
    }

    // MARK: - Gesture Handling

    /// Handles the long press gesture and triggers the `touchDownLong` closure.
    ///
    /// - Parameter gesture: The gesture recognizer instance.
    @objc private func longPress(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            touchDownLong?(self)
        }
    }

    // MARK: - Touch Event Actions

    /// Handles the touch down state with animation and invokes the `touchDown` closure.
    @objc private func touchDown(_ sender: UIButton) {
        touchDown?(sender)
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self else { return }
            alpha = 0.8
            transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }

    /// Handles the touch exit state with animation and invokes the `touchExit` closure.
    @objc private func touchExit(_ sender: UIButton) {
        touchExit?(sender)
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self else { return }
            alpha = 1
            transform = CGAffineTransform.identity
        }
    }

    /// Handles the touch up (inside) event with animation and invokes the `touchUp` closure.
    @objc private func touchUp(_ sender: UIButton) {
        touchUp?(sender)
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self else { return }
            alpha = 1
            transform = CGAffineTransform.identity
        }
    }
}

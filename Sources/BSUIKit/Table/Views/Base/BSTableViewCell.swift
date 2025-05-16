//
//  BSTableViewCell.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import UIKit

/// `BSTableViewCell` – A base class for custom `UITableViewCell` implementations with built-in UI setup, layout constraints, and interaction handling.
///
/// Designed to be subclassed, this cell provides a structured lifecycle for setting up the UI (`initUI()`),
/// applying constraints (`initConstraints()`), attaching event handlers (`initListeners()`),
/// and customizing appearance (`additionalSetup()`).
///
/// It also includes a configurable highlight animation for user selection feedback.
open class BSTableViewCell: UITableViewCell {

    let containerView = UIView()

    var colorBackground: UIColor = .clear

    public enum SelectionAnimation {
        case none
        case animate
    }

    /// Flag indicating whether highlight animations are enabled.
    private var isSelectedAnimationEnabled = true

    // MARK: - Initializers

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupContainerView()
        initUI()
        initConstraints()
        initListeners()
        additionalSetup()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle & Setup

    open func initUI() {
        // Implement in subclass
    }

    open func initConstraints() {
        // Implement in subclass
    }

    open func initListeners() {
        // Implement in subclass
    }

    open func additionalSetup() {
        backgroundColor = .clear
        selectionStyle = .none
    }

    public func selectionStyle(_ style: SelectionAnimation) {
        isSelectedAnimationEnabled = (style == .animate)
    }

    open override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        guard isSelectedAnimationEnabled else { return }

        containerView.layer.animateBackground(
            isHighlighted: highlighted,
            currentBackgroundColor: colorBackground
        )
    }

    // MARK: - Private

    private func setupContainerView() {
        super.contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

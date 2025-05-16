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
public class BSTableViewCell: UITableViewCell {

    public enum SelectionAnimation {
        case none
        case animate
    }

    /// Flag indicating whether highlight animations are enabled.
    private var isSelectedAnimationEnabled = true

    // MARK: - Initializers

    /// Initializes the cell with the given style and reuse identifier.
    ///
    /// - Parameters:
    ///   - style: The cell style.
    ///   - reuseIdentifier: A string used to identify the cell object to be reused.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
        initConstraints()
        initListeners()
        additionalSetup()
    }

    /// Required initializer for decoding from storyboard or XIB.
    ///
    /// This class is intended for programmatic use only and does not support storyboard/XIB instantiation.
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle & Setup

    /// Override this method in subclasses to initialize UI components.
    open func initUI() {
        // Implement in subclass
    }

    /// Override this method in subclasses to define layout constraints.
    open func initConstraints() {
        // Implement in subclass
    }

    /// Override this method in subclasses to attach event listeners or gesture recognizers.
    open func initListeners() {
        // Implement in subclass
    }

    /// Additional setup logic for the cell.
    /// Sets transparent backgrounds for the cell and disables selection style.
    open func additionalSetup() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }

    /// Enables or disables selection highlight animation for the cell.
    /// - Parameter state: A Boolean flag indicating whether highlight animation should be active.
    public func selectionStyle(_ style: SelectionAnimation) {
        isSelectedAnimationEnabled = (style == .animate) ? true : false
    }

    /// Handles highlight state changes with animation support if enabled.
    /// - Parameters:
    ///   - highlighted: A Boolean value that indicates if the cell is currently highlighted.
    ///   - animated: A Boolean value that indicates whether the highlight change should be animated.
    override public func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        guard isSelectedAnimationEnabled else { return }

        contentView.layer.animateBackground(
            isHighlighted: highlighted
        )
    }
}

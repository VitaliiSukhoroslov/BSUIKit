//
//  BSTableViewCell.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

#if os(iOS)
import UIKit

/// `BaseTableViewCell` - Base table cell class with user interface presets and convenient settings.
/// Provides the basic structure for creating UI components, adding blocking, and listening to events.
open class BSTableViewCell: UITableViewCell {

    /// Initializer for creating a cell programmatically.
    /// Initializes the user interface, adding constraints and event listeners.
    /// - Parameters:
    ///  - style: Cell style.
    ///  - reuseIdentifier: Identifier for reusing the cell.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
        initConstraints()
        initListeners()
        additionalSetup()
    }


    /// Initializer for initializing a cell from a storyboard or xib.
    /// Generates an error because this class is only intended to create cells programmatically.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Methods
    /// Method for initializing the user interface. Overridden in subclasses.
    open func initUI() {
    }

    /// Method for adding interface restrictions. Overridden in subclasses.
    open func initConstraints() {
    }

    /// Method for adding event listeners (handlers). Overridden in subclasses.
    open func initListeners() {
    }

    /// Additional cell settings. Sets a transparent background for the cell and its contents.
    open func additionalSetup() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }

    /// Handles the cell’s highlight state change with animation.

    /// Overrides the default highlight behavior to animate the background color
    /// of the cell’s `contentView` using the `ColorKit.TableCell.background` color.

    /// - Parameters:
    ///   - highlighted: A Boolean value indicating whether the cell is highlighted.
    ///   - animated: A Boolean value indicating whether the change should be animated.
    override public func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        contentView.layer.animateBackground(
            isHighlighted: highlighted,
            currentBackgroundColor: ColorKit.Common.cadetBlue
        )
    }
}
#endif

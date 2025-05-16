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
class BSTableViewCell: UITableViewCell {

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
    func initUI() {
    }

    /// Method for adding interface restrictions. Overridden in subclasses.
    func initConstraints() {
    }

    /// Method for adding event listeners (handlers). Overridden in subclasses.
    func initListeners() {
    }

    /// Additional cell settings. Sets a transparent background for the cell and its contents.
    func additionalSetup() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
}
#endif

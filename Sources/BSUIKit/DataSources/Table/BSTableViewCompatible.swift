//
//  BSTableViewCompatible.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

#if os(iOS)
import UIKit

/// A protocol that represents a table view cell model with switching capability (e.g., toggles, responders).
/// Useful when identifying and managing unique table view cells that can become first responders.
protocol TableViewCellSwitchCompatible: BSTableViewCompatible {

    /// A unique identifier for distinguishing models, typically used for comparison.
    var uuid: String { get }

    /// Indicates whether the cell can be edited.
    var isEditable: Bool { get }

    /// Called when the cell should become the first responder (e.g., focus input).
    /// - Returns: `true` if it successfully became first responder, otherwise `false`.
    func becomeFirstResponder() -> Bool
}

// swiftlint:disable line_length

/**
 Adopt this protocol in your model objects to make them compatible with `UITableView`.

 This protocol is intended to bridge your data models and table view presentation logic.
 It ensures that any object conforming to it knows how to return a properly configured `UITableViewCell`.
 */
public protocol BSTableViewCompatible: BSCollectionAndTableViewCompatible {

    /// The reuse identifier used to dequeue the cell.
    var reuseIdentifier: String { get }

    /**
     Called by your `UITableViewDataSource` to return a fully configured cell for a given index path.

     If your custom cell conforms to a `Configurable` protocol, you can call `configureWithModel(self)`
     to apply model data to the cell.

     - Parameters:
        - tableView: The table view requesting the cell.
        - indexPath: The index path specifying the location of the cell.
     - Returns: A configured `UITableViewCell` instance.
     */
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell
}
#endif

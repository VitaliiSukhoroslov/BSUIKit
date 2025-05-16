//
//  BSTableViewSectionHeaderCompatible.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

#if os(iOS)
import UIKit

/// A protocol representing a section header in a `UITableView`.
///
/// Conform to this protocol to define how the header view should be created and whether its section is collapsible.
public protocol BSTableViewSectionHeaderCompatible {

    /// The reuse identifier for the header view.
    var reuseIdentifier: String { get }

    /// Indicates whether the section is currently collapsed (i.e., its rows are hidden).
    ///
    /// This is typically used to control the visibility of rows in the section.
    var isCollapsed: Bool { get }

    /// Returns a configured view to be used as the header for a given section.
    ///
    /// - Parameters:
    ///   - tableView: The table view requesting the header view.
    ///   - section: The index of the section.
    /// - Returns: A `UIView` to be displayed as the section header, or `nil` if no header is needed.
    func headerForTableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
}

// MARK: - Default Implementation

public extension BSTableViewSectionHeaderCompatible {

    /// Default implementation indicating that the section is not collapsed.
    var isCollapsed: Bool {
        false
    }
}
#endif

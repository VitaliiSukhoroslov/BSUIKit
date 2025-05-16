//
//  BSTableViewSectionFooterCompatible.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

#if os(iOS)
import UIKit

/// A protocol representing a section footer in a `UITableView`.
///
/// Conform to this protocol to define how the footer view should be created and whether its section is collapsible.
public protocol BSTableViewSectionFooterCompatible {

    /// The reuse identifier for the footer view.
    var reuseIdentifier: String { get }

    /// Indicates whether the section is currently collapsed (i.e., whether the footer should be hidden).
    ///
    /// This can be used in combination with header behavior to fully collapse a section.
    var isCollapsed: Bool { get }

    /// Returns a configured view to be used as the footer for a given section.
    ///
    /// - Parameters:
    ///   - tableView: The table view requesting the footer view.
    ///   - section: The index of the section.
    /// - Returns: A `UIView` to be displayed as the section footer, or `nil` if no footer is needed.
    func footerForTableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
}

// MARK: - Default Implementation

public extension BSTableViewSectionFooterCompatible {

    /// Default implementation indicating that the footer is not collapsed.
    var isCollapsed: Bool {
        false
    }
}
#endif

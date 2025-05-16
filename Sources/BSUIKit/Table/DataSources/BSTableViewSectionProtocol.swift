//
//  BSTableViewSectionProtocol.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import UIKit

/// A protocol representing a section in a `UITableView`, including its header, footer, and row items.
///
/// Conform to this protocol to define how each section should behave and appear.
public protocol BSTableViewSectionProtocol {

    /// An optional model that provides a view for the section header.
    var headerItem: BSTableViewSectionHeaderCompatible? { get set }

    /// An optional model that provides a view for the section footer.
    var footerItem: BSTableViewSectionFooterCompatible? { get set }

    /// An array of items (rows) in the section. Each item must conform to `BSTableViewCompatible`.
    var items: [BSTableViewCompatible] { get set }

    /// Indicates whether rows in this section can be reordered.
    var canMoveRow: Bool { get }

    /// Optional custom height for the header view. If `nil`, the table view will use the default height.
    var headerHeight: CGFloat? { get set }

    /// Optional custom height for the footer view. If `nil`, the table view will use the default height.
    var footerHeight: CGFloat? { get set }
}

// MARK: - Default Implementation

public extension BSTableViewSectionProtocol {

    /// Default implementation that disallows row reordering.
    var canMoveRow: Bool {
        false
    }
}

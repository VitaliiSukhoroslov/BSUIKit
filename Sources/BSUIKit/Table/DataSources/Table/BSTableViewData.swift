//
//  BSTableViewData.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

#if os(iOS)
import UIKit

/// A protocol that provides structured data and layout information for use in a `UITableView`.
/// It defines how many sections and rows exist, how cells are configured, and what headers/footers should be displayed.
public protocol BSTableViewData {

    /// An array of sections containing the items (rows), headers, and footers for the table view.
    var sections: [BSTableViewSection] { get set }

    /// Subscript to access or update a model at a given `IndexPath`.
    subscript(indexPath: IndexPath) -> BSTableViewCompatible { get set }

    /// Returns the number of sections in the table view.
    func numberOfSections() -> Int

    /// Returns the number of rows in a given section.
    /// - Parameter section: The index of the section.
    func numberOfRowsInSection(section: Int) -> Int

    /// Returns a configured cell for a given index path.
    /// - Parameters:
    ///   - tableView: The table view requesting the cell.
    ///   - indexPath: The index path locating the cell.
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell

    /// Returns a view to display as the header for a given section.
    /// - Parameters:
    ///   - tableView: The table view requesting the view.
    ///   - section: The section index.
    func headerForTableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?

    /// Returns a view to display as the footer for a given section.
    /// - Parameters:
    ///   - tableView: The table view requesting the view.
    ///   - section: The section index.
    func footerForTableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
}

// MARK: - Default Implementations

public extension BSTableViewData {

    /// Subscript to access or assign a `BSTableViewCompatible` model at a specific `IndexPath`.
    /// - Note: The setter inserts the new value at the specified index without removing the existing item.
    subscript(indexPath: IndexPath) -> BSTableViewCompatible {
        get {
            sections[indexPath.section].items[indexPath.row]
        }
        set {
            var items = sections[indexPath.section].items
            items.insert(newValue, at: indexPath.row)
        }
    }

    /// Returns the number of sections by counting the elements in `sections`.
    func numberOfSections() -> Int {
        sections.count
    }

    /// Returns the number of rows in a section, accounting for whether the section is collapsed.
    /// - Parameter section: The index of the section.
    func numberOfRowsInSection(section: Int) -> Int {
        if let header = sections[section].headerItem {
            return header.isCollapsed ? 0 : sections[section].items.count
        }
        return sections[section].items.count
    }

    /// Returns the configured cell for the item at the specified index path.
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let model = self[indexPath]
        return model.cellForTableView(tableView: tableView, atIndexPath: indexPath)
    }

    /// Returns the view to use as the section header, if available.
    func headerForTableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        sections[section].headerItem?.headerForTableView(tableView: tableView, viewForHeaderInSection: section)
    }

    /// Returns the view to use as the section footer, if available.
    func footerForTableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        sections[section].footerItem?.footerForTableView(tableView: tableView, viewForFooterInSection: section)
    }
}
#endif

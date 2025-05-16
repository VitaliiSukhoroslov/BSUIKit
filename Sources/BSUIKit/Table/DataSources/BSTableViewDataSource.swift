//
//  TableViewDataSource.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import UIKit

/// A base class `BSTableViewDataSource` - that acts as a data source and delegate for `UITableView`.
/// Supports sectioned data, cell editing, moving, and row prefetching.
open class BSTableViewDataSource: NSObject, BSTableViewData, UITableViewDataSource, UITableViewDataSourcePrefetching {

    /// Closure called when rows are requested for prefetching.
    public var onPrefetchRows: (([IndexPath]) -> Void)?

    /// Closure called when a cell becomes one of the visible cells during scrolling.
    public var onLastVisibleCell: ((IndexPath) -> Void)?

    /// Closure called when selected row
    public var onSelectedRow: ((IndexPath) -> Void)?

    /// The associated `UITableView`.
    public let tableView: UITableView

    /// Array of sections defining the content structure of the table.
    open var sections: [BSTableViewSectionProtocol] = []

    /// Initializes the data source and assigns itself as the table’s dataSource and prefetchDataSource.
    /// - Parameter tableView: The table view this data source will be assigned to.
    public init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        tableView.dataSource = self
        tableView.prefetchDataSource = self
    }

    /// Returns the number of rows in a given section.
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRowsInSection(section: section)
    }

    /// Returns a cell for the specified index path.
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellForTableView(tableView: tableView, atIndexPath: indexPath)
    }

    /// Returns the number of sections in the table view.
    open func numberOfSections(in tableView: UITableView) -> Int {
        numberOfSections()
    }

    /// Inserts a new item at the specified index path.
    /// - Note: This method is intended to be overridden by subclasses.
    open func insertItem(atIndexPath indexPath: IndexPath) {
        // Override in subclass if needed
    }

    /// Deletes the item at the specified index path from the data model.
    open func deleteItem(atIndexPath indexPath: IndexPath) {
        self.sections[indexPath.section].items.remove(at: indexPath.row)
    }

    /// Indicates whether the row at the given index path can be moved.
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        self.sections[indexPath.section].canMoveRow
    }

    /// Handles moving a row from one index path to another.
    public func tableView(
        _ tableView: UITableView,
        moveRowAt sourceIndexPath: IndexPath,
        to destinationIndexPath: IndexPath
    ) {
        if self.sections[sourceIndexPath.section].canMoveRow == true {
            let movedObject = self.sections[sourceIndexPath.section].items[sourceIndexPath.row]
            self.sections[sourceIndexPath.section].items.remove(at: sourceIndexPath.row)
            self.sections[sourceIndexPath.section].items.insert(movedObject, at: destinationIndexPath.row)
        }
    }

    /// Indicates whether the row at the given index path can be edited.
    public func tableView(
        _ tableView: UITableView,
        canEditRowAt indexPath: IndexPath
    ) -> Bool {
        self.sections[indexPath.section].items[indexPath.row].editable
    }

    /// Scrolls to the top of the specified section.
    /// - Parameters:
    ///   - section: The section index to scroll to.
    ///   - animated: Whether to animate the scroll.
    public func scrollToSection(_ section: Int, animated: Bool) {
        if tableView.numberOfRows(inSection: section) > 0 {
            tableView.scrollToRow(at: IndexPath(row: 0, section: section), at: .top, animated: animated)
        } else {
            let headerRect = tableView.rectForHeader(inSection: section)
            tableView.scrollRectToVisible(headerRect, animated: animated)
        }
    }

    /// Called to begin prefetching data for the specified index paths.
    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        onPrefetchRows?(indexPaths)
    }

    /// Called to begin selected row
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        onSelectedRow?(indexPath)
    }
}

// MARK: - UITableViewDelegate
extension BSTableViewDataSource: UITableViewDelegate {

    /// Returns a view to use as the header for the specified section.
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        sections[section].headerItem?.headerForTableView(tableView: tableView, viewForHeaderInSection: section)
    }

    /// Returns a view to use as the footer for the specified section.
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        sections[section].footerItem?.footerForTableView(tableView: tableView, viewForFooterInSection: section)
    }

    /// Returns the height for the header in the specified section.
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        sections[section].headerHeight ?? 0.0001
    }

    /// Returns the height for the footer in the specified section.
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        sections[section].footerHeight ?? 0.0001
    }
}

// MARK: - UIScrollViewDelegate
extension BSTableViewDataSource: UIScrollViewDelegate {

    /// Called when the scroll view scrolls. Invokes `onLastVisibleCell` for each visible index path.
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let visibleIndexPaths = tableView.indexPathsForVisibleRows {
            for indexPath in visibleIndexPaths {
                onLastVisibleCell?(indexPath)
            }
        }
    }
}

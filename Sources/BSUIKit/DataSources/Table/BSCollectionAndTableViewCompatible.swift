//
//  BSCollectionAndTableViewCompatible.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import Foundation

/// A base protocol for models that are compatible with both `UICollectionView` and `UITableView`
/// Conforming types can define how their corresponding cells behave in terms of reuse, editing, movement, and prefetching.
public protocol BSCollectionAndTableViewCompatible {

    /// The reuse identifier used to dequeue a reusable cell in a collection or table view.
    var reuseIdentifier: String { get }

    /// Indicates whether the item can be edited (e.g., deleted or modified in-place).
    var editable: Bool { get }

    /// Indicates whether the item can be reordered via drag and drop.
    var movable: Bool { get }

    /// Called before the cell is displayed to prepare or load data (e.g., image fetching).
    func prefetch()

    /// Called when a previously requested prefetch is no longer needed (e.g., fast scrolling past the cell).
    func cancelPrefetch()
}

// MARK: - Default Implementations

public extension BSCollectionAndTableViewCompatible {

    /// Default implementation returns `false`, indicating the item is not editable.
    var editable: Bool {
        false
    }

    /// Default implementation returns `false`, indicating the item is not movable.
    var movable: Bool {
        false
    }

    /// Default implementation does nothing. Override to perform any needed data preloading.
    func prefetch() { }

    /// Default implementation does nothing. Override to cancel any ongoing data loading.
    func cancelPrefetch() { }
}

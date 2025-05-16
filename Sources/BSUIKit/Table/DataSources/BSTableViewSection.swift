//
//  BSTableViewSection.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import UIKit

public class BSTableViewSection: BSTableViewSectionProtocol {
    public var canMoveRow: Bool { false }

    public var headerItem: BSTableViewSectionHeaderCompatible?
    public var items: [BSTableViewCompatible]
    public var footerItem: BSTableViewSectionFooterCompatible?
    public var headerHeight: CGFloat?
    public var footerHeight: CGFloat?

    public init(
        headerItem: BSTableViewSectionHeaderCompatible? = nil,
        items: [BSTableViewCompatible],
        footerItem: BSTableViewSectionFooterCompatible? = nil,
        headerHeight: CGFloat? = nil,
        footerHeight: CGFloat? = nil
    ) {
        self.headerItem = headerItem
        self.items = items
        self.footerItem = footerItem
        if let headerHeight {
            self.headerHeight = headerHeight
        } else if headerItem != nil {
            self.headerHeight = 30
        } else {
            self.headerHeight = headerItem == nil
            ? CGFloat.leastNonzeroMagnitude
            : UITableView.automaticDimension
        }
        if let footerHeight {
            self.footerHeight = footerHeight
        } else if footerItem != nil {
            self.footerHeight = 30
        } else {
            self.footerHeight = footerItem == nil
            ? CGFloat.leastNonzeroMagnitude
            : UITableView.automaticDimension
        }
    }
}

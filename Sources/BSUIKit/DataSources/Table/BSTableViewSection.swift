//
//  BSTableViewSection.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

#if os(iOS)
import UIKit
import NFUIKit

class BSTableViewSection: BSTableViewSectionProtocol {
    var canMoveRow: Bool { false }

    var headerItem: BSTableViewSectionHeaderCompatible?
    var items: [BSTableViewCompatible]
    var footerItem: BSTableViewSectionFooterCompatible?
    var headerHeight: CGFloat?
    var footerHeight: CGFloat?
    var typeSection: Any?

    init(
        headerItem: BSTableViewSectionHeaderCompatible? = nil,
        items: [BSTableViewCompatible],
        footerItem: BSTableViewSectionFooterCompatible? = nil,
        headerHeight: CGFloat? = nil,
        footerHeight: CGFloat? = nil,
        typeSection: Any? = nil
    ) {
        self.headerItem = headerItem
        self.items = items
        self.footerItem = footerItem
        self.typeSection = typeSection
        if let headerHeight {
            self.headerHeight = headerHeight
        } else {
            self.headerHeight = headerItem == nil
            ? CGFloat.leastNonzeroMagnitude
            : UITableView.automaticDimension
        }
        if let footerHeight {
            self.footerHeight = footerHeight
        } else {
            self.footerHeight = footerItem == nil
            ? CGFloat.leastNonzeroMagnitude
            : UITableView.automaticDimension
        }
    }
}
#endif

//
//  SeparatorTableCellModel.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 17.05.2025.
//  
//

import UIKit

open class SeparatorTableCellModel: BSTableViewCompatible {

    public let input: Input

    public init(
        input: Input
    ) {
        self.input = input
    }

    // TableViewCompatible
    public var reuseIdentifier: String {
        String(describing: SeparatorTableCell.self)
    }

    public func cellForTableView(
        tableView: UITableView,
        atIndexPath indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        ) as? SeparatorTableCell else {
            return UITableViewCell()
        }

        cell.configure(with: self)
        return cell
    }
}

extension SeparatorTableCellModel {
    public struct Input {
        var height: CGFloat
        var insets: UIEdgeInsets
        var color: UIColor?

        public init(
            height: CGFloat = 1,
            insets: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0),
            color: UIColor? = ColorKit.Common.separator
        ) {
            self.height = height
            self.insets = insets
            self.color = color
        }
    }
}

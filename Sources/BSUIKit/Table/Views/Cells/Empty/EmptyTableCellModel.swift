//
//  EmptyTableCellModel.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 17.05.2025.
//  
//

import UIKit

open class EmptyTableCellModel: BSTableViewCompatible {

    public let input: Input

    public init(
        input: Input
    ) {
        self.input = input
    }

    // TableViewCompatible
    public var reuseIdentifier: String {
        String(describing: EmptyTableCell.self)
    }

    public func cellForTableView(
        tableView: UITableView,
        atIndexPath indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        ) as? EmptyTableCell else {
            return UITableViewCell()
        }

        cell.configure(with: self)
        return cell
    }
}

extension EmptyTableCellModel {
    public struct Input {
        var height: CGFloat

        public init(
            height: CGFloat = 44
        ) {
            self.height = height
        }
    }
}

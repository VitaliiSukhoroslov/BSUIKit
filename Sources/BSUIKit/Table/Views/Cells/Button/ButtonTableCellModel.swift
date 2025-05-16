//
//  ButtonTableCellModel.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//  
//

import UIKit

open class ButtonTableCellModel: BSTableViewCompatible {

    private var cell: ButtonTableCell?

    public init() {}

    // TableViewCompatible
    public var reuseIdentifier: String {
        String(describing: ButtonTableCell.self)
    }

    public func cellForTableView(
        tableView: UITableView,
        atIndexPath indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        ) as? ButtonTableCell else {
            return UITableViewCell()
        }

        self.cell = cell
        cell.configure(with: self)
        return cell
    }

    open func didTapButton() {
        print("Did Tap Button")
    }

    open var buttonSettings: ButtonSettings {
        .init()
    }

    public var isEnabled: Bool?

    public func isEnabled(_ state: Bool) {
        isEnabled = state
        cell?.isEnabled(state)
    }
}

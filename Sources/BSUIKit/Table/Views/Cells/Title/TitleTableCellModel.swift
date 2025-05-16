//
//  TitleTableCellModel.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//  
//

#if os(iOS)
import UIKit

open class TitleTableCellModel: BSTableViewCompatible {

    public let input: Input

    public init(
        input: Input
    ) {
        self.input = input
    }

    // TableViewCompatible
    public var reuseIdentifier: String {
        String(describing: TitleTableCell.self)
    }

    public func cellForTableView(
        tableView: UITableView,
        atIndexPath indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        ) as? TitleTableCell else {
            return UITableViewCell()
        }

        cell.configure(with: self)
        return cell
    }

    open var labelSettings: LabelSettings = .init(
        alignment: .left,
        font: .systemFont(ofSize: 13),
        textColor: .black,
        numberOfLines: 0,
        insets: .init(top: 0, left: 16, bottom: 0, right: 16)
    )
}

extension TitleTableCellModel {
    public struct Input {
        var title: String?

        public init(title: String?) {
            self.title = title
        }
    }
}
#endif

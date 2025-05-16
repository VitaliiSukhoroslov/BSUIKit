//
//  TitleArrowTableCellModel.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//  
//

import UIKit

open class TitleArrowTableCellModel: BSTableViewCompatible {

    public let input: Input

    public init(
        input: Input
    ) {
        self.input = input
    }

    // TableViewCompatible
    public var reuseIdentifier: String {
        String(describing: TitleArrowTableCell.self)
    }

    public func cellForTableView(
        tableView: UITableView,
        atIndexPath indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        ) as? TitleArrowTableCell else {
            return UITableViewCell()
        }

        cell.configure(with: self)
        return cell
    }

    open var labelSettings: LabelSettings {
        .init(
            alignment: .left,
            font: .systemFont(ofSize: 17, weight: .semibold),
            textColor: .black,
            numberOfLines: 0,
            insets: .init(top: 16, left: 16, bottom: 16, right: 16)
        )
    }

    open var cellSettings: CellSettings {
        .init()
    }
}

extension TitleArrowTableCellModel {
    public struct CellSettings: CellSettingsSelectionStyle,
                                CellSettingsSeparator,
                                CellSettingsArrow {
        public var isShowArrow: Bool
        public var selectedStyle: BSTableViewCell.SelectionAnimation
        public var isShowSeparator: Bool

        public init(
            selectedStyle: BSTableViewCell.SelectionAnimation = .none,
            isShowSeparator: Bool = false,
            isShowArrow: Bool = false
        ) {
            self.selectedStyle = selectedStyle
            self.isShowSeparator = isShowSeparator
            self.isShowArrow = isShowArrow
        }
    }
    public struct Input {
        var title: String?
        var arrowImage: UIImage?

        public init(
            title: String?,
            arrowImage: UIImage? = nil
        ) {
            self.title = title
            self.arrowImage = arrowImage
        }
    }
}

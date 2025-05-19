//
//  ExpandableTitleSubtitleTableCellModel.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 19.05.2025.
//  
//

import UIKit

open class ExpandableTitleSubtitleTableCellModel: BSTableViewCompatible {

    public var input: Input

    public init(
        input: Input
    ) {
        self.input = input
    }

    // TableViewCompatible
    public var reuseIdentifier: String {
        String(describing: ExpandableTitleSubtitleTableCell.self)
    }

    public func cellForTableView(
        tableView: UITableView,
        atIndexPath indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        ) as? ExpandableTitleSubtitleTableCell else {
            return UITableViewCell()
        }

        cell.configure(with: self)
        return cell
    }

    open var titleSettings: LabelSettings {
        .init(
            alignment: .left,
            font: .systemFont(ofSize: 17, weight: .semibold),
            textColor: .black,
            numberOfLines: 0,
            insets: .init(top: 0, left: 16, bottom: 0, right: 16)
        )
    }

    open var subtitleSettings: LabelSettings {
        .init(
            alignment: .left,
            font: .systemFont(ofSize: 14, weight: .regular),
            textColor: .black,
            numberOfLines: 0,
            insets: .init(top: 0, left: 16, bottom: 16, right: 16)
        )
    }

    open var cellSettings: CellSettings {
        .init()
    }

    open var containerSettings: ViewSettings {
        .init()
    }

    open var arrowImage: UIImage? {
        input.isExpanded
        ? .init(imageName: "icon_arrow_up")
        : .init(imageName: "icon_arrow_down")
    }
}

extension ExpandableTitleSubtitleTableCellModel {
    public struct CellSettings: CellSettingsSelectionStyle,
                                CellSettingsSeparator {
        public var separatorInsets: UIEdgeInsets
        public var selectedStyle: BSTableViewCell.SelectionAnimation
        public var isShowSeparator: Bool

        public init(
            separatorInsets: UIEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 0),
            selectedStyle: BSTableViewCell.SelectionAnimation = .none,
            isShowSeparator: Bool = false
        ) {
            self.separatorInsets = separatorInsets
            self.selectedStyle = selectedStyle
            self.isShowSeparator = isShowSeparator
        }
    }
    public struct Input {
        var title: String
        var subtitle: String
        var isExpanded: Bool

        public init(
            title: String,
            subtitle: String,
            isExpanded: Bool = false
        ) {
            self.title = title
            self.subtitle = subtitle
            self.isExpanded = isExpanded
        }
    }
}

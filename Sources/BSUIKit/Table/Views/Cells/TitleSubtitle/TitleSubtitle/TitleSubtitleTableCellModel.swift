//
//  TitleSubtitleTableCellModel.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 19.05.2025.
//  
//

import UIKit

open class TitleSubtitleTableCellModel: BSTableViewCompatible {

    public let input: Input

    public init(
        input: Input
    ) {
        self.input = input
    }

    // TableViewCompatible
    public var reuseIdentifier: String {
        String(describing: TitleSubtitleTableCell.self)
    }

    public func cellForTableView(
        tableView: UITableView,
        atIndexPath indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        ) as? TitleSubtitleTableCell else {
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
            insets: .init(top: 0, left: 16, bottom: 0, right: 16)
        )
    }

    open var cellSettings: CellSettings {
        .init()
    }

    open var containerSettings: ViewSettings {
        .init()
    }
}

extension TitleSubtitleTableCellModel {
    public struct CellSettings: CellSettingsSelectionStyle, CellSettingsSeparator {
        public var separatorInsets: UIEdgeInsets
        public var selectedStyle: BSTableViewCell.SelectionAnimation
        public var isShowSeparator: Bool

        public init(
            selectedStyle: BSTableViewCell.SelectionAnimation = .none,
            isShowSeparator: Bool = false,
            separatorInsets: UIEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 0)
        ) {
            self.selectedStyle = selectedStyle
            self.isShowSeparator = isShowSeparator
            self.separatorInsets = separatorInsets
        }
    }
    public struct Input {
        var title: String
        var subtitle: String?

        public init(
            title: String,
            subtitle: String?
        ) {
            self.title = title
            self.subtitle = subtitle
        }
    }
}

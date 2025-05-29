//
//  TitleCheckboxTableCellModel.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 29.05.2025.
//  
//

import UIKit

open class TitleCheckboxTableCellModel: BSTableViewCompatible {

    public var input: Input

    public init(
        input: Input
    ) {
        self.input = input
    }

    // TableViewCompatible
    public var reuseIdentifier: String {
        String(describing: TitleCheckboxTableCell.self)
    }

    public func cellForTableView(
        tableView: UITableView,
        atIndexPath indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        ) as? TitleCheckboxTableCell else {
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
            insets: .init(top: 16, left: 16, bottom: 16, right: 16)
        )
    }

    open var cellSettings: CellSettings {
        .init()
    }

    open var containerSettings: ViewSettings {
        .init()
    }

    open var checkBoxImage: UIImage? {
        isOn
        ? .init(imageName: "icon_checkbox_on")
        : .init(imageName: "icon_checkbox_off")
    }

    var isOn: Bool {
        input.isOn
    }

    open func toggleIsOn() {
        var isOn = input.isOn
        isOn.toggle()
        input.isOn = isOn
    }
}

extension TitleCheckboxTableCellModel {
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
        var title: String?
        var isOn: Bool

        public init(
            title: String?,
            isOn: Bool = true
        ) {
            self.title = title
            self.isOn = isOn
        }
    }
}

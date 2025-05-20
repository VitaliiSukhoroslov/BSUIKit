//
//  CellSettings.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import UIKit

public protocol CellSettingsSelectionStyle {
    var selectedStyle: BSTableViewCell.SelectionAnimation { get }
}

public protocol CellSettingsSeparator {
    var isShowSeparator: Bool { get }
    var separatorInsets: UIEdgeInsets { get }
}

public protocol CellSettingsArrow {
    var isShowArrow: Bool { get }
}

public protocol CellSettingsSwitch {
    var isEnabledSwitch: Bool { get }
    var isShowSwitch: Bool { get }
}

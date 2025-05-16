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
}

public protocol CellSettingsArrow {
    var isShowArrow: Bool { get }
}

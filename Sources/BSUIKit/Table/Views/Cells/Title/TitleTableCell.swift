//
//  TitleTableCell.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//  
//

#if os(iOS)
import UIKit
import SnapKit

public class TitleTableCell: BSTableViewCell, CellConfigurable {

    public var model: TitleTableCellModel?

    public func configure(with model: TitleTableCellModel) {
        self.model = model

        model.labelSettings.setupLabel(titleLabel, title: model.input.title)

        titleLabel.snp.remakeConstraints {
            $0.top.equalToSuperview().offset(model.labelSettings.insets.top)
            $0.bottom.equalToSuperview().offset(-model.labelSettings.insets.bottom)
            $0.trailing.equalToSuperview().offset(-model.labelSettings.insets.right)
            $0.leading.equalToSuperview().offset(model.labelSettings.insets.left)
        }

        layoutIfNeeded()
    }

    // UI
    private let titleLabel = UILabel()

    override public func initUI() {
        contentView.addSubview(titleLabel)
    }

    override public func initConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }

    override public func initListeners() {
//        selectionStyle = .none
    }
}
#endif

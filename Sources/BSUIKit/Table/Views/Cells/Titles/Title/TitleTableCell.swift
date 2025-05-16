//
//  TitleTableCell.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//  
//

import UIKit
import SnapKit

public class TitleTableCell: BSTableViewCell, CellConfigurable {

    public var model: TitleTableCellModel?

    public func configure(with model: TitleTableCellModel) {
        self.model = model

        model.labelSettings.setup(titleLabel, title: model.input.title)

        titleLabel.snp.remakeConstraints {
            $0.top.equalToSuperview().offset(model.labelSettings.insets.top)
            $0.bottom.equalToSuperview().offset(-model.labelSettings.insets.bottom)
            $0.trailing.equalToSuperview().offset(-model.labelSettings.insets.right)
            $0.leading.equalToSuperview().offset(model.labelSettings.insets.left)
        }

        separatorView.isHidden = !model.cellSettings.isShowSeparator
        selectionStyle(model.cellSettings.selectedStyle)

        layoutIfNeeded()
    }

    // UI
    private let titleLabel = UILabel()
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorKit.Common.separator
        return view
    }()

    override public func initUI() {
        contentView.addSubviews(titleLabel, separatorView)
    }

    override public func initConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        separatorView.snp.makeConstraints {
            $0.leading.bottom.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}

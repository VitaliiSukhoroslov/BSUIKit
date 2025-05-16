//
//  TitleArrowTableCell.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//  
//

import UIKit
import SnapKit

public final class TitleArrowTableCell: BSTableViewCell, CellConfigurable {

    public var model: TitleArrowTableCellModel?

    public func configure(with model: TitleArrowTableCellModel) {
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

        arrowImageView.isHidden = !model.cellSettings.isShowArrow
        if let iconArrow = model.input.arrowImage {
            arrowImageView.image = iconArrow
        } else {
            arrowImageView.image = .init(imageName: "icon_arrow_right")
        }

        layoutIfNeeded()
    }

    // UI
    private let titleLabel = UILabel()
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorKit.Common.separator
        return view
    }()

    override public func initUI() {
        contentView.addSubviews(titleLabel, arrowImageView, separatorView)
    }

    override public func initConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalTo(arrowImageView.snp.leading).offset(-16)
        }
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
            $0.trailing.equalToSuperview().offset(-16)
        }
        separatorView.snp.makeConstraints {
            $0.leading.bottom.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}

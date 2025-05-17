//
//  SeparatorTableCell.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 17.05.2025.
//  
//

import UIKit
import SnapKit

public final class SeparatorTableCell: BSTableViewCell, CellConfigurable {

    public var model: SeparatorTableCellModel?

    public func configure(with model: SeparatorTableCellModel) {
        self.model = model

        separatorView.backgroundColor = model.input.color
        separatorView.snp.remakeConstraints {
            $0.height.equalTo(model.input.height)
            $0.top.equalToSuperview().offset(model.input.insets.top)
            $0.bottom.equalToSuperview().offset(-model.input.insets.bottom)
            $0.trailing.equalToSuperview().offset(-model.input.insets.right)
            $0.leading.equalToSuperview().offset(model.input.insets.left)
        }
    }

    // UI
    private let separatorView = UIView()

    public override func initUI() {
        containerView.addSubview(separatorView)
    }

    public override func initConstraints() {
        separatorView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}

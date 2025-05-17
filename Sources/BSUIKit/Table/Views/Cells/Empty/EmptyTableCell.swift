//
//  EmptyTableCell.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 17.05.2025.
//  
//

import UIKit
import SnapKit

public final class EmptyTableCell: BSTableViewCell, CellConfigurable {

    public var model: EmptyTableCellModel?

    public func configure(with model: EmptyTableCellModel) {
        self.model = model

        emptyView.snp.updateConstraints {
            $0.height.equalTo(model.input.height)
        }
    }

    // UI
    private let emptyView = UIView()

    public override func initUI() {
        containerView.addSubview(emptyView)
    }

    public override func initConstraints() {
        emptyView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(0)
        }
    }
}

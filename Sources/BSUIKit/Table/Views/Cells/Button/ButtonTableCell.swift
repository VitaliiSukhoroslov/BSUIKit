//
//  ButtonTableCell.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//  
//

import UIKit
import SnapKit

public final class ButtonTableCell: BSTableViewCell, CellConfigurable {

    public var model: ButtonTableCellModel?

    public func configure(with model: ButtonTableCellModel) {
        self.model = model

        model.buttonSettings.setup(button)
        button.snp.remakeConstraints {
            $0.height.equalTo(48)
            $0.top.equalToSuperview().offset(model.buttonSettings.insets.top)
            $0.bottom.equalToSuperview().offset(-model.buttonSettings.insets.bottom)
            $0.trailing.equalToSuperview().offset(-model.buttonSettings.insets.right)
            $0.leading.equalToSuperview().offset(model.buttonSettings.insets.left)
        }
        if let state = model.isEnabled {
            button.isEnabled = state
        }
    }

    // UI
    private let button: BSButton = {
        let button = BSButton()
        button.backgroundColor = .systemBlue
        return button
    }()

    public override func initUI() {
        containerView.addSubview(button)
    }

    public override func initConstraints() {
        button.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
    }

    public override func initListeners() {
        selectionStyle(.none)

        button.touchUp = { [weak self] _ in
            self?.model?.didTapButton()
        }
    }

    func isEnabled(_ state: Bool) {
        button.isEnabled = state
    }
}

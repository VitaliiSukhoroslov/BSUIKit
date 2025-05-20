//
//  TitleSwitchTableCell.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 20.05.2025.
//  
//

import UIKit
import SnapKit

public final class TitleSwitchTableCell: BSTableViewCell, CellConfigurable {

    public var model: TitleSwitchTableCellModel?

    public func configure(with model: TitleSwitchTableCellModel) {
        self.model = model

        model.titleSettings.setup(titleLabel, title: model.input.title)

        titleLabel.snp.remakeConstraints {
            $0.top.equalToSuperview().offset(model.titleSettings.insets.top)
            $0.bottom.equalToSuperview().offset(-model.titleSettings.insets.bottom)
            $0.trailing.equalToSuperview().offset(-model.titleSettings.insets.right)
            $0.leading.equalToSuperview().offset(model.titleSettings.insets.left)
        }

        separatorView.isHidden = !model.cellSettings.isShowSeparator
        selectionStyle(model.cellSettings.selectedStyle)

        switchView.isOn = model.isOn
        switchView.isEnabled = model.cellSettings.isEnabledSwitch
        switchView.isHidden = !model.cellSettings.isShowSwitch

        model.switchSettings.setup(switchView)

        colorBackground = model.containerSettings.backgroundColor
        model.containerSettings.setup(containerView)
        containerView.snp.remakeConstraints {
            $0.top.equalToSuperview().offset(model.containerSettings.insets.top)
            $0.bottom.equalToSuperview().offset(-model.containerSettings.insets.bottom)
            $0.trailing.equalToSuperview().offset(-model.containerSettings.insets.right)
            $0.leading.equalToSuperview().offset(model.containerSettings.insets.left)
        }

        separatorView.snp.remakeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
            $0.trailing.equalToSuperview().offset(-model.cellSettings.separatorInsets.right)
            $0.leading.equalToSuperview().offset(model.cellSettings.separatorInsets.left)
        }

        layoutIfNeeded()
    }

    // UI
    private let titleLabel = UILabel()
    private let switchView: UISwitch = {
        let view = UISwitch()
        return view
    }()
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorKit.Common.separator
        return view
    }()

    override public func initUI() {
        containerView.addSubviews(titleLabel, switchView, separatorView)
    }

    override public func initConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalTo(switchView.snp.leading).offset(-16)
        }
        switchView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
        }
        separatorView.snp.makeConstraints {
            $0.leading.bottom.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }

    public override func initListeners() {
        switchView.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
    }

    @objc func switchToggled(_ sender: UISwitch) {
        guard let model else { return }

        model.toggleIsOn(sender.isOn)
    }
}

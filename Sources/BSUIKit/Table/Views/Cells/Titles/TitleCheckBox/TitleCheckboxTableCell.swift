//
//  TitleCheckboxTableCell.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 29.05.2025.
//  
//

import UIKit
import SnapKit

public final class TitleCheckboxTableCell: BSTableViewCell, CellConfigurable {

    public var model: TitleCheckboxTableCellModel?

    public func configure(with model: TitleCheckboxTableCellModel) {
        self.model = model

        model.titleSettings.setup(titleLabel, title: model.input.title)

        titleLabel.snp.remakeConstraints {
            $0.top.equalToSuperview().offset(model.titleSettings.insets.top)
            $0.bottom.equalToSuperview().offset(-model.titleSettings.insets.bottom)
            $0.trailing.equalTo(containerCheckBoxView.snp.leading).offset(-model.titleSettings.insets.right)
            $0.leading.equalToSuperview().offset(model.titleSettings.insets.left)
        }

        separatorView.isHidden = !model.cellSettings.isShowSeparator
        selectionStyle(model.cellSettings.selectedStyle)

        checkBoxImageView.image = model.checkBoxImage

        addTargets()

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
    private let containerCheckBoxView = UIView()
    private let checkBoxImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorKit.Common.separator
        return view
    }()

    override public func initUI() {
        containerView.addSubviews(titleLabel, containerCheckBoxView, separatorView)
        containerCheckBoxView.addSubview(checkBoxImageView)
    }

    override public func initConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalTo(containerCheckBoxView.snp.leading).offset(10)
        }
        containerCheckBoxView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10)
            $0.size.equalTo(44)
        }
        checkBoxImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(24)
        }
        separatorView.snp.makeConstraints {
            $0.leading.bottom.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }

    public override func initListeners() {}

    private func addTargets() {
        guard let model else { return }

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))

        if model.cellSettings.selectedStyle == .animate {
            onTapContainer = { [weak self] in
                self?.didTap()
            }
        } else {
            containerCheckBoxView.isUserInteractionEnabled = true
            containerCheckBoxView.addGestureRecognizer(tapGesture)
        }
    }

    @objc func didTap() {
        model?.toggleIsOn()
        DispatchQueue.main.async { [weak self] in
            self?.checkBoxImageView.image = self?.model?.checkBoxImage
        }
    }
}

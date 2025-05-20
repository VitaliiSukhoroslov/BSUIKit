//
//  ExpandableTitleSubtitleTableCell.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 19.05.2025.
//  
//

import UIKit
import SnapKit

public final class ExpandableTitleSubtitleTableCell: BSTableViewCell, CellConfigurable {

    public var model: ExpandableTitleSubtitleTableCellModel?

    public func configure(with model: ExpandableTitleSubtitleTableCellModel) {
        self.model = model

        mainStackView.removeAllArrangedSubviewsCompletely()

        model.titleSettings.setup(titleLabel, title: model.input.title)

        mainStackView.addArrangedSubview(titleContainerView)
        titleContainerView.addSubview(titleLabel)

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(model.titleSettings.insets.top)
            $0.bottom.equalToSuperview().offset(-model.titleSettings.insets.bottom)
            $0.trailing.equalToSuperview().offset(-model.titleSettings.insets.right)
            $0.leading.equalToSuperview().offset(model.titleSettings.insets.left)
        }

        arrowImageView.snp.remakeConstraints {
            $0.centerY.equalTo(titleContainerView)
            $0.size.equalTo(24)
            $0.trailing.equalToSuperview().offset(-16)
        }

        separatorView.isHidden = !model.cellSettings.isShowSeparator
        selectionStyle(model.cellSettings.selectedStyle)

        if model.input.isExpanded {
            setupSubtitle(model.input.subtitle)
        } else {
            subtitleContainerView.removeFromSuperview()
        }

        arrowImageView.image = model.arrowImage

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
    }

    private var containerViewConstraintBottom: Constraint?

    // UI
    public let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()

    private let titleContainerView = UIView()
    private let titleLabel = UILabel()

    private let subtitleContainerView = UIView()
    private let subtitleLabel = UILabel()

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
        containerView.addSubviews(mainStackView, arrowImageView, separatorView)
    }

    override public func initConstraints() {
        mainStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(arrowImageView.snp.leading).offset(-16)
            containerViewConstraintBottom = $0.bottom.equalToSuperview().priority(.low).constraint
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

    public override func initListeners() {
        titleContainerView.isUserInteractionEnabled = true
        titleContainerView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(didTapTitle))
        )
        arrowImageView.isUserInteractionEnabled = true
        arrowImageView.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(didTapTitle))
        )
    }

    @objc
    private func didTapTitle() {
        model?.input.isExpanded.toggle()

        guard let model else { return }
        configure(with: model)
        updateTableView()
    }

    private func setupSubtitle(_ subtitle: String) {
        guard let model else { return }

        model.subtitleSettings.setup(subtitleLabel, title: subtitle)
        mainStackView.addArrangedSubview(subtitleContainerView)
        subtitleContainerView.addSubview(subtitleLabel)

        subtitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(model.subtitleSettings.insets.top)
            $0.bottom.equalToSuperview().offset(-model.subtitleSettings.insets.bottom)
            $0.trailing.equalToSuperview().offset(-model.subtitleSettings.insets.right)
            $0.leading.equalToSuperview().offset(model.subtitleSettings.insets.left)
        }
    }
}

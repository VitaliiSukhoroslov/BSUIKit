//
//  LoadableView.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import UIKit

protocol LoadableView: AnyObject {
    var loadingBackgroundColor: UIColor { get }
    var loadingIndicatorTintColor: UIColor { get }

    func startLoading()
    func stopLoading()
}

extension LoadableView where Self: UIView {
    func startLoading() {
        if let view = subviews.first(where: { $0.tag == 1 }) {
            return
        }

        let backgroundView = UIView(frame: bounds)
        backgroundView.alpha = 0.0
        backgroundView.tag = 1
        backgroundView.backgroundColor = loadingBackgroundColor

        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = loadingIndicatorTintColor
        activityIndicator.center = backgroundView.center
        activityIndicator.startAnimating()

        addSubview(backgroundView)
        backgroundView.addSubview(activityIndicator)

        UIView.animate(withDuration: 0.25) {
            backgroundView.alpha = 1.0
        }
    }

    func stopLoading() {
        guard let view = subviews.first(where: { $0.tag == 1 }) else {
            return
        }

        UIView.animate(
            withDuration: 0.25,
            animations: {
                view.alpha = 0.0
            },
            completion: { _ in
                view.removeFromSuperview()
            }
        )
    }
}

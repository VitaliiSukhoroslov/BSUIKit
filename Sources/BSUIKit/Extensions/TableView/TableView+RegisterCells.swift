//
//  TableView+RegisterCells.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import UIKit

public extension UITableView {
    func register<T: UITableViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) {
        let identifier = String(describing: name)
        var bundle: Bundle?

        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }

        register(UINib(nibName: identifier, bundle: bundle), forCellReuseIdentifier: identifier)
    }

    func register<T: UITableViewCell>(cellClass name: T.Type) {
        register(name, forCellReuseIdentifier: String(describing: name))
    }

    func register<T: UITableViewHeaderFooterView>(nibWithHeaderFooterViewClass name: T.Type) {
        register(
            UINib(nibName: String(describing: name), bundle: Bundle.main),
            forHeaderFooterViewReuseIdentifier: String(describing: name)
        )
    }

    func register<T: UITableViewHeaderFooterView>(headerFooterViewClass name: T.Type) {
        register(
            name,
            forHeaderFooterViewReuseIdentifier: String(describing: name)
        )
    }

    func reloadDataAnimated() {
        UIView.transition(
            with: self,
            duration: 0.1,
            options: .transitionCrossDissolve,
            animations: { self.reloadData() }
        )
    }
}

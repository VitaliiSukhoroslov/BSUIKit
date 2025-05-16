//
//  CellConfigurable.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

import Foundation

public protocol CellConfigurable {

    associatedtype T
    var model: T? { get set }
    func configure(with model: T)

}

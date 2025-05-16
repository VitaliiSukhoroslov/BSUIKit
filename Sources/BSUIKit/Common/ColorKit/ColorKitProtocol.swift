//
//  ColorKitProtocol.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//
#if os(iOS)
/// A protocol defining a structure for organizing color groups used throughout the application.

/// This protocol uses associated types to allow flexibility in how different color categories
/// (such as `Common`) are implemented and accessed.

/// Conforming types should provide color definitions that follow the `CommonColorProtocol`.
protocol ColorKitProtocol {
    associatedtype Common: CommonColorProtocol
}
#endif

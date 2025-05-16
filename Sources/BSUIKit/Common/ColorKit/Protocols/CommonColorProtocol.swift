//
//  CommonColorProtocol.swift
//  BSUIKit
//
//  Created by Виталий Сухорослов on 16.05.2025.
//

#if os(iOS)
import UIKit

/// A protocol defining a set of common UI colors used throughout the application.
/// Color names are chosen based on https://www.color-name.com/hex to ensure consistency and readability.
public protocol CommonColorProtocol {
    /// Gray
    static var metallicSilver: UIColor { get }
    /// Gray Divider
    static var metallicSilverDivider: UIColor { get }
    /// Blue
    static var policeBlue: UIColor { get }
    /// Deep Blue
    static var deepBlue: UIColor { get }
    /// Black
    static var raisinBlack: UIColor { get }
    /// Red
    static var venetianRed: UIColor { get }
    /// Green
    static var darkLemonLime: UIColor { get }
    /// GrayText
    static var grayText: UIColor { get }
    /// DarkBlueGray Text
    static var darkBlueGrayText: UIColor { get }
    /// Deep Koamaru
    static var deepKoamaru: UIColor { get }
    /// Cadet Blue
    static var cadetBlue: UIColor { get }
    /// Space Cadet
    static var spaceCadet: UIColor { get }
    /// Separator Color
    static var separator: UIColor { get }
}

/// A namespace that defines a standard palette of commonly used colors across the app.
/// All colors are defined using their hexadecimal values and named according to www.color-name.com for consistency.
public extension ColorKit {
    enum Common: CommonColorProtocol {
        public static var separator = UIColor(netHex: 0xAAAFBC).withAlphaComponent(0.2)
        public static var metallicSilver = UIColor(netHex: 0x9FA4B3)
        public static var metallicSilverDivider = UIColor(netHex: 0xA7A9AB)
        public static var policeBlue = UIColor(netHex: 0x3F4A68)
        public static var deepBlue = UIColor(netHex: 0x192947)
        public static var raisinBlack = UIColor(netHex: 0x231F20)
        public static var venetianRed = UIColor(netHex: 0xF06262)
        public static var darkLemonLime = UIColor(netHex: 0x8AB634)
        public static var grayText = UIColor(netHex: 0x767676)
        public static var darkBlueGrayText = UIColor(netHex: 0x627497)
        public static var deepKoamaru = UIColor(netHex: 0x2A3657)
        public static var cadetBlue = UIColor(netHex: 0xAAAFBC)
        public static let spaceCadet = UIColor(netHex: 0x242E49)
    }
}
#endif

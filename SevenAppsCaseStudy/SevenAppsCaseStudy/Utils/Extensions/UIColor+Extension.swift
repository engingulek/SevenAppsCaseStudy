//
//  UIColor+Extension.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
import UIKit.UIColor

// MARK: - UIColor Extension
/// An extension for `UIColor` to initialize it using a hexadecimal string.
extension UIColor {
    /// Initializes a `UIColor` instance using a hex string.
        /// - Parameter hex: The hex string representing the color.
        /// - Returns: A `UIColor` object or `nil` if the hex string is invalid.
   public convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}

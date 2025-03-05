//
//  UIActivityIndicatorView+Extension.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
import UIKit
// MARK: - UIActivityIndicatorView Extension
/// An extension for `UIActivityIndicatorView` to provide a custom base activity indicator.
extension UIActivityIndicatorView {
    static public func baseActivityIndicator() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.color = UIColor(hex: ColorTheme.black.rawValue)
        indicator.style = .large
        return indicator
    }
}

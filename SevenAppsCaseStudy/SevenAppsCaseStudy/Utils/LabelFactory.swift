//
//  LabelFactory.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
import UIKit

// MARK: - LabelType Enum
/// Defines different types of labels used in the application.
enum LabelType {
    case mediumCellLabel
    case mediumCellTitleLabel
    case mediumErrorMessageLabel
    case mediumLabel
    case mediumTitleLabel
    case largetTitleLabel
}

// MARK: - LabelFactory
/// A factory struct for creating `UILabel` instances based on `LabelType`.
struct LabalFactory {
    
    /// Creates a `UILabel` with predefined styles based on the given `LabelType`.
       /// - Parameter type: The type of label to create.
       /// - Returns: A configured `UILabel` instance.
    static func createLabel(ofType type: LabelType) -> UILabel {
        let label = UILabel()
        switch type {
        case .mediumCellLabel:
            label.font = .systemFont(ofSize: 18)
            label.textColor = .black
        case .mediumCellTitleLabel:
            label.textColor = .black
            label.font = .systemFont(ofSize: 18, weight: .semibold)
            
        case .mediumErrorMessageLabel:
            label.textColor = .red
            label.font = .systemFont(ofSize: 18, weight: .semibold)
        case .mediumLabel:
            label.font = .systemFont(ofSize: 20)
            label.textColor = .black
        case .mediumTitleLabel:
            label.textColor = .black
            label.font = .systemFont(ofSize: 18, weight: .semibold)
        case .largetTitleLabel:
            label.textColor = .black
            label.font = .systemFont(ofSize: 20, weight: .semibold)
        }
        return label
    }
}

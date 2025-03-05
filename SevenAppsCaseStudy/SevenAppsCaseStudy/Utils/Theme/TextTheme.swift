//
//  TextTheme.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation


enum TextTheme : String {
    case userListTitle
    case nameTitle
    case emailTitle
    case errorMessage
    
    
    var localized: String {
        switch self {
        case .userListTitle:
            return NSLocalizedString("userListTitle",comment: "userListTitle text")
        case .nameTitle:
            return NSLocalizedString("nameTitle",comment: "nameTitle text")
        case .emailTitle:
            return NSLocalizedString("emailTitle",comment: "emailTitle text")
        case .errorMessage:
            return NSLocalizedString("errorMessage",comment: "errorMessage text")
        }
    }
}

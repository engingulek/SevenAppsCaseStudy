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
    case websiteTitle
    case phoneTitle
    case detail
    case addressTitle
    case streetTitle
    case suiteTitle
    case cityTitle
    case zipcodeTitle
    
    
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
        case .detail:
            return NSLocalizedString("detail",comment: "detail text")
            
        case .websiteTitle:
            return NSLocalizedString("websiteTitle",comment: "websiteTitle text")
            
        case .phoneTitle:
            return NSLocalizedString("phoneTitle",comment: "phoneTitle text")
        case .addressTitle:
            return NSLocalizedString("address",comment: "address text")
        case .streetTitle:
            return NSLocalizedString("street",comment: "street text")
        case .suiteTitle:
            return NSLocalizedString("suite",comment: "suite text")
        case .cityTitle:
            return NSLocalizedString("city",comment: "city text")
        case .zipcodeTitle:
            return NSLocalizedString("zipcode",comment: "zipcode text")
        }
    }
}

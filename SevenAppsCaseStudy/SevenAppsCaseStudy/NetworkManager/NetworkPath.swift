//
//  NetworkPath.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
import Alamofire

public enum  NetworkPath {
    case users
    case user(Int)
}


extension NetworkPath : TargetType {
    var baseURL: String {
        return NetworkConstants.baseUrl.rawValue
    }
    
    var path: String {
        switch self {
        case .users:
            return NetworkConstants.users.rawValue
        case .user(let id):
            return NetworkConstants.users.rawValue + "/\(id)"
        }
    }
    
    var method: AlamofireMethod {
        switch self {
        default:
            return .GET
        }
    }
    
    var requestType: RequestType {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}

//
//  UserModel.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation

// MARK: - User
struct User: Codable {
    let id: Int
    let name, email: String
}

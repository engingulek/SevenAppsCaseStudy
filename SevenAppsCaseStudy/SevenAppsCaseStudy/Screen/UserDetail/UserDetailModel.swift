//
//  UserDetailModel.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation

//MARK: - UserDetail
struct UserDetail: Decodable {
    let id: Int
    let name, email: String
    let address: Address
    let phone, website: String
    
}
//MARK: - Address
struct Address: Decodable {
    let street, suite, city, zipcode: String
}

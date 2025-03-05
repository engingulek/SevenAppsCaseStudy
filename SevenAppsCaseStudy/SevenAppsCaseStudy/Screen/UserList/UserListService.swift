//
//  UserListService.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
// MARK: - UserListServiceProtocol
/// Protocol defining the contract for fetching a list of users.
protocol UserListServiceProtocol {
    func fetchUserList() async -> (list:[User],errorState:Bool)
}


class UserListService : UserListServiceProtocol {
    private let networkManager : NetworkManagerProtocol = NetworkManager()
    
    // MARK: - Methods
       /// Fetches a list of users asynchronously
       /// - Returns: A tuple containing a list of users and an error state
    func fetchUserList() async -> (list:[User],errorState:Bool) {
        let list:[User]
        let errorState:Bool
        do{
            let result = try await networkManager.fetch(target: .users, responseClass: [User].self)
            list = result
            errorState = result.isEmpty
        }catch{
            list = []
            errorState = true
        }
        return (list,errorState)
    }
}

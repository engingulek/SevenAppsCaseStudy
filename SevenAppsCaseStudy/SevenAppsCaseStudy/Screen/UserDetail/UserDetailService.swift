//
//  UserDetailService.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation

// MARK: - UserDetailServiceProtocol
/// Protocol for the User Detail service
protocol UserDetailServiceProtocol {
    func fetchDetail(id:Int) async -> (detail:UserDetail?,errorState:Bool)
}


class UserDetailService : UserDetailServiceProtocol {
    private let networkManager : NetworkManagerProtocol = NetworkManager()
    
    // MARK: - UserDetailServiceProtocol Methods
        /// Fetches the details of a user based on their ID.
        /// - Parameter id: The id of the user.
        /// - Returns: A tuple containing the fetched user detail and a boolean indicating if an error occurred.
    func fetchDetail(id: Int) async -> (detail: UserDetail?, errorState: Bool) {
        let detail:UserDetail?
        let errorState:Bool
        
        do{
            let result = try await networkManager.fetch(target: .user(id), responseClass: UserDetail?.self)
            
            guard let result = result else {
                detail = nil
                errorState = true
                return (detail,errorState)
            }
            detail = result
            errorState = false
            
        }catch{
            detail = nil
            errorState = true
        }
        return (detail,errorState)
        
    }
}

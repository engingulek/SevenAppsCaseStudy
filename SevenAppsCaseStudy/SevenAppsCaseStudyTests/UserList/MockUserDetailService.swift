//
//  MockUserDetailService.swift
//  SevenAppsCaseStudyTests
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
@testable import SevenAppsCaseStudy

enum MockError : Error {
    case mockError
}

class MockUserListService : UserListServiceProtocol {
    var mockList : [User] = []
    var mockFetchRestaurantError = false
    func fetchUserList() async -> (list: [SevenAppsCaseStudy.User], errorState: Bool) {
        if mockFetchRestaurantError {
            return ([],true)
        }
        return (mockList,false)
    }
}

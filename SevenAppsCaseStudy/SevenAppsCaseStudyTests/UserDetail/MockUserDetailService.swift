//
//  MockUserDetailService.swift
//  SevenAppsCaseStudyTests
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
@testable import SevenAppsCaseStudy

class MockUserDetailService : UserDetailServiceProtocol {
    var mockDetail : UserDetail? = nil
    var mockFetchDetailError = false
    func fetchDetail(id: Int) async -> (detail: SevenAppsCaseStudy.UserDetail?, errorState: Bool) {
        let detail:UserDetail?
        let errorState:Bool
        if mockFetchDetailError {
            detail = nil
            errorState = true
            return (detail,errorState)
        }
        errorState = false
        detail = mockDetail
        return (detail,errorState)
    }
}

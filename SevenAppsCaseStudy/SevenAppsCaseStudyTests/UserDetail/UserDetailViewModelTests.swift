//
//  UserDetailViewModelTests.swift
//  SevenAppsCaseStudyTests
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
import XCTest
@testable import SevenAppsCaseStudy


final class UserDetailViewModelTests : XCTestCase {
    private var viewModel : UserDetailViewModel!
    private var view:MockUserDetaliViewController!
    private var service : MockUserDetailService!
    
    override  func setUp() {
        super.setUp()
        view = .init()
        service = .init()
        viewModel = .init(service: service)
        viewModel.delegate = view
    }
    
    
    func test_viewDidLoad_setBackColorAble() {
        XCTAssertFalse(view.invokedsetBackColorAble)
        XCTAssertEqual(view.invokesetBackColorAbleCount, 0,"is not correct")
       
        viewModel.viewDidLoad()
        
        XCTAssertTrue(view.invokedsetBackColorAble)
        XCTAssertEqual(view.invokesetBackColorAbleCount, 1,"is not correct")
        XCTAssertEqual(view.invokedsetBackColorAbleData.map(\.color), [ColorTheme.primaryBackColor.rawValue])
    }
    
    
    
    func test_viewDidLoad_navigationTitle(){
        XCTAssertFalse(view.invokedesetNavigationTitle)
        XCTAssertEqual(view.invokesetNavigationTitleCount, 0,"is not correct")
        viewModel.viewDidLoad()
        
        
        XCTAssertTrue(view.invokedesetNavigationTitle)
        XCTAssertEqual(view.invokesetNavigationTitleCount, 1,"is not correct")
        let expectedContract = NavigationTitleContract(prefersLargeTitle: false, title: TextTheme.detail.localized, titleType: .inline)
        
        XCTAssertEqual(view.invokedsetNavigationTitleData.map(\.contract.prefersLargeTitle), [expectedContract.prefersLargeTitle])
        
        XCTAssertEqual(view.invokedsetNavigationTitleData.map(\.contract.title), [expectedContract.title])
        
        
        XCTAssertEqual(view.invokedsetNavigationTitleData.map(\.contract.titleType), [expectedContract.titleType])
        
    }
    
    func test_viewDidLoad_IfIdIsNil_ReturnError() {
        XCTAssertFalse(view.invokederrorState)
        XCTAssertEqual(view.invokeerrorStateCount, 0,"is not correct")
        
        viewModel.viewDidLoad()
        
        XCTAssertTrue(view.invokederrorState)
        XCTAssertEqual(view.invokeerrorStateCount, 1,"is not correct")
        
        XCTAssertEqual(view.invokederrorStateData.map(\.isHidden),[false])
        XCTAssertEqual(view.invokederrorStateData.map(\.message), [TextTheme.errorMessage.localized])
    }
    
    
    func test_viewDidLoad_WhenFetchDetail_ReturnError() {
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokederrorState)
        XCTAssertEqual(view.invokeerrorStateCount, 0,"is not correct")
        
        service.mockFetchDetailError = true
        viewModel.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(self.view.invokederrorState)
            XCTAssertEqual(self.view.invokeerrorStateCount, 1,"is not correct")
            
            XCTAssertEqual(self.view.invokederrorStateData.map(\.isHidden),[false])
            XCTAssertEqual(self.view.invokederrorStateData.map(\.message), [TextTheme.errorMessage.localized])
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
       
    }
    
    
    func test_viewDidLoad_WhenFetchDetail_ReturnTitle(){
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedsetData)
        XCTAssertEqual(view.invokesedsetDataCount, 0,"is not correct")
        

        viewModel.id = 1
        service.mockDetail = .init(id: 1, name: "Test Name", email: "Test Email",
                                   address:.init(street: "Test Street", suite: "Test Suit",
                                                 city: "Test City", zipcode: "Test Zipcode"),
                                   phone: "Test Phone", website: "Test Website")
        viewModel.viewDidLoad()
        
        let expectedTitle = TitleContract(
            nameTitle: TextTheme.nameTitle.localized,
            emailTitle: TextTheme.emailTitle.localized,
            phoneTitle: TextTheme.phoneTitle.localized,
            websiteTitle: TextTheme.websiteTitle.localized,
            addressTitle: TextTheme.addressTitle.localized,
            streetTitle: TextTheme.streetTitle.localized,
            suiteTitle: TextTheme.suiteTitle.localized,
            cityTitle: TextTheme.cityTitle.localized,
            zipcodeTitle: TextTheme.zipcodeTitle.localized
        )
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(self.view.invokedsetData)
            XCTAssertEqual(self.view.invokesedsetDataCount, 1,"is not correct")
            
            let incoming = self.view.invokedsetDataData.map(\.title)
            XCTAssertEqual(incoming, [expectedTitle])
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
}

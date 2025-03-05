//
//  UserListViewModelTests.swift
//  SevenAppsCaseStudyTests
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
import XCTest
@testable import SevenAppsCaseStudy

final class UserListViewModelTests: XCTestCase {
    private var viewModel : UserListViewModel!
    private var view : MockUserListViewController!
    private var service : MockUserListService!
    
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
        let expectedContract = NavigationTitleContract(prefersLargeTitle: true, title: TextTheme.userListTitle.localized, titleType: .always)
        
        XCTAssertEqual(view.invokedsetNavigationTitleData.map(\.contract.prefersLargeTitle), [expectedContract.prefersLargeTitle])
        
        XCTAssertEqual(view.invokedsetNavigationTitleData.map(\.contract.title), [expectedContract.title])
        
        
        XCTAssertEqual(view.invokedsetNavigationTitleData.map(\.contract.titleType), [expectedContract.titleType])
        
    }
    
    
    
    func test_viewDidload_whenGetUserList_ReturnNotError() {
        XCTAssertFalse(view.invokederrorState)
        XCTAssertEqual(view.invokeerrorStateCount, 0,"is not correct")
        
        viewModel.viewDidLoad()
        
        XCTAssertFalse(view.invokederrorState)
        XCTAssertEqual(view.invokeerrorStateCount, 0,"is not correct")
        XCTAssertEqual(view.invokederrorStateData.map(\.message),[],"is not correct")
        XCTAssertEqual(view.invokederrorStateData.map(\.isHidden),[],"is not correct")
        
    }
    
    func test_viewDidLoad_prepareTableView() {
        XCTAssertFalse(view.invokedPrepareTableView)
        XCTAssertEqual(view.invokedPrepareTableViewCount, 0,"is not correct")
        
        viewModel.viewDidLoad()
        
        XCTAssertTrue(view.invokedPrepareTableView)
        XCTAssertEqual(view.invokedPrepareTableViewCount, 1,"is not correct")
    }
    
    func test_viewDidload_whenGetUserList_ReturnError() {
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokederrorState)
        XCTAssertEqual(view.invokeerrorStateCount, 0,"is not correct")
        
        service.mockFetchRestaurantError = true
        viewModel.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(self.view.invokederrorState)
            XCTAssertEqual(self.view.invokeerrorStateCount, 1,"is not correct")
            XCTAssertEqual(self.view.invokederrorStateData.map(\.message),[TextTheme.errorMessage.localized],"is not correct")
            XCTAssertEqual(self.view.invokederrorStateData.map(\.isHidden),[false],"is not correct")
            expectation.fulfill()
            
        }
        wait(for: [expectation], timeout: 5)
    }
    
    
    func test_viewDidload_reloadTableView() {
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedreloadTableView)
        XCTAssertEqual(view.invokedreloadTableViewCount, 0,"is not correct")
        
        service.mockFetchRestaurantError = true
        viewModel.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(self.view.invokedreloadTableView)
            XCTAssertEqual(self.view.invokeerrorStateCount, 1,"is not correct")
            expectation.fulfill()
            
        }
        wait(for: [expectation], timeout: 5)
        
    }
    
    func test_viewDidload_loadingAction() {
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedstartLoading)
        XCTAssertEqual(view.invokedstartLoadingCount, 0,"is not correct")
        
        XCTAssertFalse(view.invokedstopLoading)
        XCTAssertEqual(view.invokedstopLoadingCount, 0,"is not correct")
        
        viewModel.viewDidLoad()
        XCTAssertTrue(view.invokedstartLoading)
        XCTAssertEqual(view.invokedstartLoadingCount, 1,"is not correct")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(self.view.invokedstopLoading)
            XCTAssertEqual(self.view.invokedstopLoadingCount, 1,"is not correct")
            expectation.fulfill()
            
        }
        wait(for: [expectation], timeout: 5)
        
    }
    
    func test_WhendidSelectUser() {
        let expectation = XCTestExpectation(description: "Async task completed")
        XCTAssertFalse(view.invokedpushViewControllerAble)
        XCTAssertEqual(view.invokepushViewControllerAbleCount, 0,"is not correct")
        service.mockList = [.init(id: 0, name: "test", email: "test")]
        viewModel.viewDidLoad()
        
        let indexPath : IndexPath = [0,0]
        viewModel.didSelectRow(at: indexPath)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertTrue(self.view.invokedpushViewControllerAble)
            XCTAssertEqual(self.view.invokepushViewControllerAbleCount, 1,"is not correct")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
}

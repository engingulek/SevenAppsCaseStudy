//
//  MockUserListViewController.swift
//  SevenAppsCaseStudyTests
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
@testable import SevenAppsCaseStudy
class MockUserListViewController : UserListViewModelOutputProtocol {
    
    var invokedsetBackColorAble:Bool = false
    var invokesetBackColorAbleCount:Int = 0
    var invokedsetBackColorAbleData = [(color:String,Void)]()
    func setBackColorAble(color: String) {
         invokedsetBackColorAble = true
         invokesetBackColorAbleCount += 1
        invokedsetBackColorAbleData.append((color: color, ()))
    }
    
    var invokedPrepareTableView:Bool = false
    var invokedPrepareTableViewCount:Int = 0
    func prepareTableView() {
         invokedPrepareTableView = true
         invokedPrepareTableViewCount += 1
    }
    
    var invokedreloadTableView:Bool = false
    var invokedreloadTableViewCount:Int = 0
    
    func reloadTableView() {
         invokedreloadTableView = true
         invokedreloadTableViewCount += 1
    }
    
    
    var invokedstartLoading:Bool = false
    var invokedstartLoadingCount:Int = 0
    func startLoading() {
        
         invokedstartLoading = true
         invokedstartLoadingCount += 1
    }
    
    var invokedstopLoading:Bool = false
    var invokedstopLoadingCount:Int = 0
    func stopLoading() {
         invokedstopLoading = true
         invokedstopLoadingCount += 1
    }
    
    
    var invokederrorState:Bool = false
    var invokeerrorStateCount:Int = 0
    var invokederrorStateData = [(message:String,isHidden:Bool)]()
    func errorState(message: String, isHidden: Bool) {
         invokederrorState = true
        invokeerrorStateCount += 1
        invokederrorStateData.append((message: message, isHidden: isHidden))
    }
    
    var invokedesetNavigationTitle:Bool = false
    var invokesetNavigationTitleCount:Int = 0
    var invokedsetNavigationTitleData = [(contract:SevenAppsCaseStudy.NavigationTitleContract,Void)]()
    func setNavigationTitle(contract: SevenAppsCaseStudy.NavigationTitleContract) {
         invokedesetNavigationTitle = true
         invokesetNavigationTitleCount += 1
        invokedsetNavigationTitleData.append((contract: contract, ()))
    }
}

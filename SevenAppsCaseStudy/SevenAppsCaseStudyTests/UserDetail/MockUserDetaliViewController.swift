//
//  MockUserDetaliViewController.swift
//  SevenAppsCaseStudyTests
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
import UIKit
@testable import SevenAppsCaseStudy

class MockUserDetaliViewController : UserDetailViewModelOutputProtocol {
 

    var invokedsetData:Bool = false
    var invokesedsetDataCount:Int = 0
    var invokedsetDataData = [(userDetail:SevenAppsCaseStudy.UserDetail,title:SevenAppsCaseStudy.TitleContract)]()
    
    func setData(userDetail: SevenAppsCaseStudy.UserDetail, title: SevenAppsCaseStudy.TitleContract) {
        invokedsetData = true
        invokesedsetDataCount += 1
        invokedsetDataData.append((userDetail: userDetail, title: title))
    }
    

    var invokederrorState:Bool = false
    var invokeerrorStateCount:Int = 0
    var invokederrorStateData = [(message:String,isHidden:Bool)]()
    func errorState(isHidden: Bool, message: String) {
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
    
    var invokedsetBackColorAble:Bool = false
    var invokesetBackColorAbleCount:Int = 0
    var invokedsetBackColorAbleData = [(color:String,Void)]()
    func setBackColorAble(color: String) {
         invokedsetBackColorAble = true
         invokesetBackColorAbleCount += 1
        invokedsetBackColorAbleData.append((color: color, ()))
    }
}

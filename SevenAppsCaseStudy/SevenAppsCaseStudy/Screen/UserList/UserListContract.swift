//
//  UserListContract.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation

// MARK: - NavigationTitleContract Struct
struct NavigationTitleContract {
    let prefersLargeTitle:Bool
    let title:String
    let titleType:TitleType
    
}

//MARK: - TitleType
enum TitleType : Int{
    case automatic = 0
    case always = 1
    case never = 2
    @available(iOS 17.0, *)
    case inline = 3
}

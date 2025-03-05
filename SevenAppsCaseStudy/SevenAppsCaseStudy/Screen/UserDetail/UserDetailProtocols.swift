//
//  UserDetailProtocols.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation

typealias UserDetailKits = UIViewAble & NavigationTitleAble

//MARK: - UserDetailViewModelInputProtocol
/// The input protocol for the UserDetailViewModel.
protocol UserDetailViewModelInputProtocol {
    var delegate : UserDetailViewModelOutputProtocol? {set get}
    var id:Int? {get set}
    func viewDidLoad()
    
}

//MARK: - UserDetailViewModelOutputProtocol
/// The output protocol for the UserDetailViewModel.
protocol UserDetailViewModelOutputProtocol : AnyObject,UserDetailKits {
    func setData(userDetail:UserDetail,title:TitleContract)
    func errorState(isHidden:Bool,message:String)
}

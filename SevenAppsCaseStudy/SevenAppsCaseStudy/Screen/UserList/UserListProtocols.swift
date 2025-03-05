//
//  UserListProtocols.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation

// MARK: - UserListViewModelInputProtocol
/// The input protocol for the UserListViewModel.
protocol UserListViewModelInputProtocol   {
    var delegate : UserListViewModelOutputProtocol? {set get}
    func viewDidLoad()
    func numberOfItems() -> Int
    func cellForItem(at indexPath:IndexPath) ->(user:User,title:(nameTitle:String,emailTitle:String))
    func heightForRow() -> CGFloat
}

// MARK: - UserListViewModelOutputProtocol
/// The output protocol for the UserListViewModel.
protocol UserListViewModelOutputProtocol : AnyObject {
    func prepareTableView()
    func reloadTableView()
}

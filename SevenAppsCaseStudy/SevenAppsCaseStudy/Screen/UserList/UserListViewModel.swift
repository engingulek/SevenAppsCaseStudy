//
//  UserListViewModel.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation

// MARK: - UserListViewModel
class UserListViewModel: UserListViewModelInputProtocol {

    weak var delegate: UserListViewModelOutputProtocol?
    
    func viewDidLoad() {
        delegate?.prepareTableView()
        delegate?.reloadTableView()
    }
    
    func numberOfItems() -> Int {
        return 10
    }
    
    func cellForItem(at indexPath: IndexPath) -> User {
        let user = User(id: 0, name: "Test Name", email: "Test Email")
        return user
    }
    
    func heightForRow() -> CGFloat {
        return 80
    }
    
    
    
    
    
}

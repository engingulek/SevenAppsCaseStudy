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
    
    /// Returns the data for a particular cell at the specified index path.
    /// - Parameters:
    ///   - indexPath: The index path of the cell.
    /// - Returns: A tuple containing the `User` and  `nameTitle and emial title`
    func cellForItem(at indexPath: IndexPath) ->(user:User,title:(nameTitle:String,emailTitle:String)){
        let user : User = User(id: 0, name: "Test Name", email: "Test Email")
        let title = (nameTitle:TextTheme.nameTitle.localized,emailTitle:TextTheme.emailTitle.localized)
        return (user,title)
    }
    
    func heightForRow() -> CGFloat {
        return 80
    }
    
    
    
    
    
}

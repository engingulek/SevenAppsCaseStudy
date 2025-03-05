//
//  UserListViewModel.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation

// MARK: - UserListViewModel
class UserListViewModel{
    private lazy var list : [User] = []
    private  var service : UserListServiceProtocol
    
    init(service:UserListServiceProtocol) {
        self.service = service
    }
    weak var delegate: UserListViewModelOutputProtocol?
    
    private func getUserList() {
        Task{
            let result = await  service.fetchUserList()
            list = result.list
            delegate?.reloadTableView()
        }
    }
}


extension UserListViewModel: UserListViewModelInputProtocol {
    func viewDidLoad() {
        delegate?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        delegate?.prepareTableView()
        delegate?.reloadTableView()
        
        let navigationTitleContract = NavigationTitleContract(
            prefersLargeTitle: true,
            title: TextTheme.userListTitle.localized,
            titleType: .always)
        delegate?.setNavigationTitle(contract: navigationTitleContract)
        getUserList()
    }
    
    func numberOfItems() -> Int {
        return list.count
    }
    
    /// Returns the data for a particular cell at the specified index path.
    /// - Parameters:
    ///   - indexPath: The index path of the cell.
    /// - Returns: A tuple containing the `User` and  `nameTitle and emial title`
    func cellForItem(at indexPath: IndexPath) ->(user:User,title:(nameTitle:String,emailTitle:String)){
        let user : User = list[indexPath.row]
        let title = (nameTitle:TextTheme.nameTitle.localized,emailTitle:TextTheme.emailTitle.localized)
        return (user,title)
    }
    
    func heightForRow() -> CGFloat {
        return 80
    }
}

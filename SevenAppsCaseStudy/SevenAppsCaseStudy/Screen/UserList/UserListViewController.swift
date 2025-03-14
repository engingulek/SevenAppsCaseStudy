//
//  UserListViewController.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
import UIKit
import SnapKit


class UserListViewController: UIViewController{
    private lazy var viewModel : UserListViewModelInputProtocol = UserListViewModel(service: UserListService())
    private lazy var userListTableView = UITableView()
    private lazy var loadingView = UIActivityIndicatorView.baseActivityIndicator()
    private lazy var errorMessageLabel = LabalFactory.createLabel(ofType: .mediumErrorMessageLabel)
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.viewDidLoad()
        userListTableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.identifier)
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(userListTableView)
        userListTableView.snp.makeConstraints { make in
            make.size.equalToSuperview()
        }
    }
}

//MARK: - UserListViewController : UserListViewModelOutputProtocol
extension UserListViewController : UserListViewModelOutputProtocol {
    
    func prepareTableView() {
        userListTableView.dataSource = self
        userListTableView.delegate = self
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            userListTableView.reloadData()
        }
    }
    
    func startLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            loadingView.startAnimating()
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            loadingView.stopAnimating()
        }
    }
    
    func errorState(message:String,isHidden:Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            errorMessageLabel.isHidden = isHidden
            errorMessageLabel.text = message
        }
    }
}


//MARK: - UserListViewController : UITableViewDelegate,UITableViewDataSource
extension UserListViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: UserTableViewCell.identifier,
            for: indexPath) as? UserTableViewCell else {return UITableViewCell()}
        let item = viewModel.cellForItem(at: indexPath)
        cell.configureData(user: item.user, title: item.title)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRow()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
    
}

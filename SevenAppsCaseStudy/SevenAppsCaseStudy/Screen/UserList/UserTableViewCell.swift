//
//  UserTableViewCell.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
import UIKit
import SnapKit
class UserTableViewCell : UITableViewCell {
    
    static let identifier : String =  "userTableViewCellIdentifier"
    private lazy var nameTitleLabel = LabalFactory.createLabel(ofType: .mediumCellTitleLabel)
    private lazy var nameLabel = LabalFactory.createLabel(ofType: .mediumCellLabel)
    private lazy var emailLabel = LabalFactory.createLabel(ofType: .mediumCellLabel)
    private lazy var emailTitleLabel = LabalFactory.createLabel(ofType: .mediumCellTitleLabel)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    
    private func configureUI(){
        contentView.addSubview(nameTitleLabel)
        nameTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTitleLabel.snp.top)
            make.leading.equalTo(nameTitleLabel.snp.trailing)
        }
        
        contentView.addSubview(emailTitleLabel)
        emailTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTitleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        
        contentView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTitleLabel.snp.top)
            make.leading.equalTo(emailTitleLabel.snp.trailing)
        }
    }
    
    func configureData(user:User,title:(nameTitle:String,emailTitle:String)) {
        nameTitleLabel.text = title.nameTitle
        nameLabel.text = user.name
        emailTitleLabel.text = title.emailTitle
        emailLabel.text = user.email
    }
    
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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
    
    static let identifier : String =  "UserTableViewCellIdentifier"
    private lazy var nameLabel = LabalFactory.createLabel(ofType: .mediumCellLabel)
    private lazy var emailLabel = LabalFactory.createLabel(ofType: .mediumCellLabel)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        
    }
    
    
    private func configureUI(){
      
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
    
        contentView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
    }
    
    func configureData(user:User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
    
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

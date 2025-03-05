//
//  UserDetailViewController.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
import UIKit
import SnapKit

class UserDetailViewController : UIViewController {
    
    private var viewModel : UserDetailViewModelInputProtocol
    init(viewModel:UserDetailViewModelInputProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var nameTitleLabel = LabalFactory.createLabel(ofType: .mediumTitleLabel)
    private lazy var nameLabel = LabalFactory.createLabel(ofType: .mediumLabel)
    
    private lazy var emailTitleLabel = LabalFactory.createLabel(ofType: .mediumTitleLabel)
    private lazy var emailLabel = LabalFactory.createLabel(ofType: .mediumLabel)
    
    private lazy var phoneTitleLabel = LabalFactory.createLabel(ofType: .mediumTitleLabel)
    private lazy var phoneLabel = LabalFactory.createLabel(ofType: .mediumLabel)
    
    private lazy var webSiteTitleLabel = LabalFactory.createLabel(ofType: .mediumTitleLabel)
    private lazy var websiteLabel = LabalFactory.createLabel(ofType: .mediumLabel)
    
    private lazy var adressTitle = LabalFactory.createLabel(ofType: .largetTitleLabel)
    
    private lazy var streetTitleLabel = LabalFactory.createLabel(ofType: .mediumTitleLabel)
    private lazy var streetLabel = LabalFactory.createLabel(ofType: .mediumLabel)
    
    private lazy var suiteTitleLabel = LabalFactory.createLabel(ofType: .mediumTitleLabel)
    private lazy var suiteLabel = LabalFactory.createLabel(ofType: .mediumLabel)
    
    private lazy var cityTitleLabel = LabalFactory.createLabel(ofType: .mediumTitleLabel)
    private lazy var cityLabel = LabalFactory.createLabel(ofType: .mediumLabel)
    
    private lazy var zipCodeTitleLabel = LabalFactory.createLabel(ofType: .mediumTitleLabel)
    private lazy var zipCodeLabel = LabalFactory.createLabel(ofType: .mediumLabel)
    private lazy var errorMessageLabel = LabalFactory.createLabel(ofType: .mediumErrorMessageLabel)
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.viewDidLoad()
        configureUI()
    }
    
    func configureUI(){
    
        view.addSubview(nameTitleLabel)
        nameTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.equalToSuperview().offset(20)
        }
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTitleLabel.snp.top)
            make.leading.equalTo(nameTitleLabel.snp.trailing).offset(20)
        }
        
        view.addSubview(emailTitleLabel)
        emailTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTitleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTitleLabel.snp.top)
            make.leading.equalTo(emailTitleLabel.snp.trailing).offset(10)
        }
        
        
        view.addSubview(phoneTitleLabel)
        phoneTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTitleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        view.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneTitleLabel.snp.top)
            make.leading.equalTo(phoneTitleLabel.snp.trailing).offset(10)
        }
        
        
        view.addSubview(webSiteTitleLabel)
        webSiteTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneTitleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        view.addSubview(websiteLabel)
        websiteLabel.snp.makeConstraints { make in
            make.top.equalTo(webSiteTitleLabel.snp.top)
            make.leading.equalTo(webSiteTitleLabel.snp.trailing).offset(10)
        }
        
        view.addSubview(adressTitle)
        adressTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(websiteLabel.snp.bottom).offset(20)
        }
        
        view.addSubview(streetTitleLabel)
        streetTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(adressTitle.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        view.addSubview(streetLabel)
        streetLabel.snp.makeConstraints { make in
            make.top.equalTo(streetTitleLabel.snp.top)
            make.leading.equalTo(streetTitleLabel.snp.trailing).offset(10)
        }
        
        
        view.addSubview(suiteTitleLabel)
        suiteTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(streetTitleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        view.addSubview(suiteLabel)
        suiteLabel.snp.makeConstraints { make in
            make.top.equalTo(suiteTitleLabel.snp.top)
            make.leading.equalTo(suiteTitleLabel.snp.trailing).offset(10)
        }
        
        
        view.addSubview(cityTitleLabel)
        cityTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(suiteTitleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        view.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(cityTitleLabel.snp.top)
            make.leading.equalTo(cityTitleLabel.snp.trailing).offset(10)
        }
        
        
        view.addSubview(zipCodeTitleLabel)
        zipCodeTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(cityTitleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        view.addSubview(zipCodeLabel)
        zipCodeLabel.snp.makeConstraints { make in
            make.top.equalTo(zipCodeTitleLabel.snp.top)
            make.leading.equalTo(zipCodeTitleLabel.snp.trailing).offset(10)
        }
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

extension UserDetailViewController : UserDetailViewModelOutputProtocol {

    func setData(userDetail: UserDetail,title:TitleContract) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            nameLabel.text = userDetail.name
            nameTitleLabel.text = title.nameTitle
            
            emailTitleLabel.text = title.emailTitle
            emailLabel.text = userDetail.email
            
            phoneTitleLabel.text = title.phoneTitle
            phoneLabel.text = userDetail.phone
            
            webSiteTitleLabel.text = title.websiteTitle
            websiteLabel.text = userDetail.website
            
            adressTitle.text = title.addressTitle
            
            streetTitleLabel.text =  title.streetTitle
            streetLabel.text = userDetail.address.street
            
            suiteTitleLabel.text = title.suiteTitle
            suiteLabel.text = userDetail.address.suite
            
            cityTitleLabel.text = title.cityTitle
            cityLabel.text = userDetail.address.city
            
            zipCodeTitleLabel.text = title.zipcodeTitle
            zipCodeLabel.text = userDetail.address.zipcode
        }
    }
    
    func errorState(isHidden: Bool, message: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            errorMessageLabel.isHidden = isHidden
            errorMessageLabel.text = message
        }
    }
}

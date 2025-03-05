//
//  UserLDetailViewModel.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation

//MARK: - UserDetailViewModel
class UserDetailViewModel : UserDetailViewModelInputProtocol {
    var id:Int?
    weak var delegate: UserDetailViewModelOutputProtocol?
    private  var service : UserDetailServiceProtocol
    init(service:UserDetailServiceProtocol) {
        self.service = service
    }
    
    func viewDidLoad() {
        delegate?.setBackColorAble(color: ColorTheme.primaryBackColor.rawValue)
        let navigationTitleContract = NavigationTitleContract(prefersLargeTitle: false, title: TextTheme.detail.localized, titleType: .inline)
        delegate?.setNavigationTitle(contract: navigationTitleContract)
        
        guard let id = id else {
            delegate?.errorState(isHidden: false, message: TextTheme.errorMessage.localized)
            return}
        getDetail(id: id)
    }
    
    // MARK: - GetDetail
        /// Fetches user detail data asynchronously.
        /// - Parameter id: The ID of the user whose details are being fetched.
   private func getDetail(id: Int) {
        Task{
            let result = await service.fetchDetail(id: id)
            let contract = TitleContract(
                nameTitle: TextTheme.nameTitle.localized,
                emailTitle: TextTheme.emailTitle.localized,
                phoneTitle: TextTheme.phoneTitle.localized,
                websiteTitle: TextTheme.websiteTitle.localized,
                addressTitle: TextTheme.addressTitle.localized,
                streetTitle: TextTheme.streetTitle.localized,
                suiteTitle: TextTheme.suiteTitle.localized,
                cityTitle: TextTheme.cityTitle.localized,
                zipcodeTitle: TextTheme.zipcodeTitle.localized
            )
            
            guard let detail = result.detail else {
                delegate?.errorState(isHidden: true, message: TextTheme.errorMessage.localized)
                return}
            delegate?.setData(userDetail: detail, title: contract)
           
        }
    }
}

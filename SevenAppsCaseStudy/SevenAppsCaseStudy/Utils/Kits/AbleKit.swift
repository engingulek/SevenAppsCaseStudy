//
//  AbleKit.swift
//  SevenAppsCaseStudy
//
//  Created by Engin Gülek on 5.03.2025.
//

import Foundation
import UIKit

// MARK: - UIViewAble Protocol
/// It enforces conforming types to implement `setBackColorAble(color:)` method.
protocol UIViewAble {
    func setBackColorAble(color:String)
}

extension UIViewAble where Self : UIViewController  {
    ///It sets the background color of the view using a hex string.
    func setBackColorAble(color:String){
        view.backgroundColor = UIColor(hex:color)
    }
}


// MARK: - NavigationTitleAble Protocol
protocol NavigationTitleAble {
    func setNavigationTitle(contract:NavigationTitleContract)
    
}

extension NavigationTitleAble where Self : UIViewController {
    /// It configures the navigation bar title settings according to the given `NavigationTitleContract`.
    func setNavigationTitle(contract:NavigationTitleContract) {
        navigationController?.navigationBar.prefersLargeTitles = contract.prefersLargeTitle
        navigationItem.largeTitleDisplayMode = convertToUINavigationMode(contract.titleType)
        navigationItem.title = contract.title
    }
    
    /// Converts a `TitleType` enum value to `UINavigationItem.LargeTitleDisplayMode`  for proper title display behavior in the navigation bar.
    private func convertToUINavigationMode(_ titleType: TitleType) -> UINavigationItem.LargeTitleDisplayMode {
        switch titleType {
        case .automatic:
            return .automatic
        case .always:
            return .always
        case .never:
            return .never
        case .inline:
            return .inline
        }
    }
}


// MARK: - SegueAble Protocol
/// This protocol defines a method for pushing a view controller onto the navigation stack.
public protocol SegueAble {
    /// Pushes the given `UIViewController` onto the navigation stack.
    /// - Parameters:
    ///   - vc: The view controller to be pushed.
    ///   - animated: A Boolean value indicating whether the transition is animated.
    func pushViewControllerAble (_ vc:UIViewController,animated:Bool)
}

extension SegueAble  where Self : UIViewController{
    func pushViewControllerAble (_ vc:UIViewController,animated:Bool) {
        navigationController?.pushViewController(vc, animated: animated)
    }
}


//
//  MainTabBarController.swift
//  Scoreo
//
//  Created by Remya on 10/29/22.
//

import Foundation
import UIKit
class MainTabBarController: UITabBarController,UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected item")
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected view controller")
        if (viewController as? UINavigationController)?.viewControllers.first is HomeViewController{
            HomeViewController.popupFlag = 1
        }
    }
}

//
//  UserTabBarController.swift
//  ProgrammaticTabBar
//
//  Created by Mddaniyal on 3/17/25.
//

import UIKit

class UserTabBarController: UITabBarController {

    override func viewDidLoad() {
        
        configureTabbar()
        selectedIndex = 1
        super.viewDidLoad()
    }
    
    func configureTabbar() {
        
        let vc1 = ViewController()
        let vc2 = SeearchViewController()
        let vc3 = ProfileViewController()
        
        
        vc1.tabBarItem.image =  UIImage(systemName: "house.fill")
        vc2.tabBarItem.image =  UIImage(systemName: "magnifyingglass")
        vc3.tabBarItem.image =  UIImage(systemName: "person.fill")
        
        
        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "Profile"
        
        let nav1 = UINavigationController(rootViewController: vc1)
    
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        
        
        tabBar.backgroundColor = .white
        
        setViewControllers([nav2, nav1, nav3], animated: true)
        
    }
    
}

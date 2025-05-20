//
//  SettingViewController.swift
//  ProgrammaticTabBar
//
//  Created by Mddaniyal on 3/17/25.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tabBarItems: UITabBar!
    
    @IBOutlet weak var home: UITabBarItem!
    
    @IBOutlet weak var setting: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tabBarItems.delegate = self
    }
    
    
    
    
}

extension SettingViewController: UITabBarDelegate {
    
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
     
        if item == home {
            
            
        }
        
    }
    \
    
    
}

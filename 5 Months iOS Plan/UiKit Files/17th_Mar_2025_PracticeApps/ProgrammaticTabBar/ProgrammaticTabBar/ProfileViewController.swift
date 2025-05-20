//
//  ProfileViewController.swift
//  ProgrammaticTabBar
//
//  Created by Mddaniyal on 3/17/25.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    
    @IBAction func btnTapped(_ sender: Any) {
        
        print("Btn Tapped!")
        
        self.navigationController?.pushViewController(SettingViewController(), animated: true)
        
//        present(SettingViewController(), animated: true)
    }
    
}

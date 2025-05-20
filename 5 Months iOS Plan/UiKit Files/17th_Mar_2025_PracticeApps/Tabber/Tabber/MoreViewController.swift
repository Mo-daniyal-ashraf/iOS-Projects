//
//  MOREViewController.swift
//  Tabber
//
//  Created by Mddaniyal on 3/17/25.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func btnTapped(_ sender: Any) {
        
//        if let storyboard = storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController {
            navigationController?.pushViewController(SettingViewController(), animated: true)
//        }
        
        print("Btn clicked")
    }
}

//
//  seecondViewController.swift
//  UInavigationBar
//
//  Created by Mddaniyal on 3/11/25.
//

import UIKit

class seecondViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "New Back",
            style: .done,
            target: self,
            action: #selector(gotoBack))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Next",
            style: .plain,
            target: self,
            action: nil)
    }
    @objc func gotoBack() {
        
        navigationController?.popViewController(animated: true)
    }
}

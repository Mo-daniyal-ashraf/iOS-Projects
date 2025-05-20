//
//  ViewController.swift
//  UInavigationBar
//
//  Created by Mddaniyal on 3/11/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Home"
        view.backgroundColor = .gray
        
        setUpNavigationBar()
        
        
    }

    @IBAction func clickBtn(_ sender: UIButton) {
        
        if let storyboard = storyboard?.instantiateViewController(withIdentifier: "seecondViewController") {
            navigationController?.pushViewController(storyboard, animated: true)
        }
//        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setUpNavigationBar() {
        
        navigationItem.title = "User"
        
        // Left Side Button
        let leftItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .done,
            target: self,
            action: nil
        )
        
        // Right Side Buttons
        let right1 = UIBarButtonItem(
            title: "Next",
            style: .done,
            target: self,
            action: #selector(gptoSecondVieew)
        )
        
        let right2 = UIBarButtonItem(
            title: "Save",
            style: .done,
            target: self,
            action: #selector(printSomething)
        )
        
        let right3 = UIBarButtonItem(
            title: "Edit",
            style: .done,
            target: self,
            action: nil
        )
        
        let right4 = UIBarButtonItem(
            title: "Delete",
            style: .done,
            target: self,
            action: nil
        )
        
        // Make "Next" Button Bold
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 17)
        ]
        right1.setTitleTextAttributes(attributes, for: .normal)
        
        // Grouping Right Items
        let rightGroup = UIBarButtonItemGroup(barButtonItems: [right1, right2, right3, right4], representativeItem: nil)
        
        // Assign to Navigation Item
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItems = rightGroup.barButtonItems
    }
            
    @objc func gptoSecondVieew() {
        
        if let storyboard = storyboard?.instantiateViewController(withIdentifier: "seecondViewController") {
            navigationController?.pushViewController(storyboard, animated: true)
        }
    }
            
    @objc func printSomething() {
        
        print("Hello")
    }
}


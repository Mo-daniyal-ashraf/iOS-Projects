//
//  FinaltodoPage.swift
//  PassDataBetweenViews
//
//  Created by MdAshraf on 09/12/1946 Saka.
//

import UIKit

class Logindetails: UIViewController {

        let titleLabel = UILabel()
        let tasksLabel = UILabel()
    
        var loginDetails: String = ""
    
        override func viewDidLoad() {
            
            super.viewDidLoad()
            view.backgroundColor = .white
            setupUI()
        }
        
        func setupUI() {

            titleLabel.text = "Login Details"
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(titleLabel)
            
            tasksLabel.text = loginDetails
            tasksLabel.textAlignment = .center
            tasksLabel.numberOfLines = 0
            tasksLabel.font = UIFont.systemFont(ofSize: 18)
            tasksLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(tasksLabel)
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                tasksLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                tasksLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                tasksLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        }
    
}
Status of the day : 28th_Feb_2025

- Adding element using code
- Navigation between two Views
- Passing data from viewA to viewB
- Created a login form

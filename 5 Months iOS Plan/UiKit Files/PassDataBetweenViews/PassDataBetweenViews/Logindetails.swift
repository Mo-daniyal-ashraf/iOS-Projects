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
        let sendDataButton = UIButton()
    
        var loginDetails: String = ""
        
        var delegate: LoginStatusDelegate?
    
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
            
            sendDataButton.setTitle("Send Data", for: .normal)
            sendDataButton.backgroundColor = .systemBlue
            sendDataButton.setTitleColor(.white, for: .normal)
            sendDataButton.layer.cornerRadius = 8
            sendDataButton.translatesAutoresizingMaskIntoConstraints = false
            sendDataButton.addTarget(self, action: #selector(sendDataFunc), for: .touchUpInside)
            view.addSubview(sendDataButton)
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                
                tasksLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                tasksLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                tasksLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
                sendDataButton.topAnchor.constraint(equalTo: tasksLabel.bottomAnchor, constant: 20),
                sendDataButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                sendDataButton.widthAnchor.constraint(equalToConstant: 120),
                sendDataButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    
        @objc func sendDataFunc() {
            delegate?.displayLoginStatus(status: loginDetails)
            navigationController?.popViewController(animated: false)
        }
    
}

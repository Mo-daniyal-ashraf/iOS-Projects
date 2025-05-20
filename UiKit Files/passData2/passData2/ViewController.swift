//
//  ViewController.swift
//  PassDataBetweenViews
//
//  Created by MdAshraf on 09/12/1946 Saka.
//



import UIKit

class ViewController: UIViewController, LoginStatusDelegate {

    let email = UITextField()
    let password = UITextField()
    let addButton = UIButton(type: .system)
    let titleLabel = UILabel()
    
    let statusLabel = UILabel()
        
    func setupUI() {

        titleLabel.text = "Login Form"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        email.placeholder = "Enter your email"
        email.borderStyle = .roundedRect
        email.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(email)
        
        password.placeholder = "Enter your password"
        password.borderStyle = .roundedRect
        password.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(password)
        
        addButton.setTitle("Login", for: .normal)
        addButton.backgroundColor = .systemBlue
        addButton.setTitleColor(.white, for: .normal)
        addButton.layer.cornerRadius = 8
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(loginFunc), for: .touchUpInside)
        view.addSubview(addButton)
        
        statusLabel.text = "No status"
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont.boldSystemFont(ofSize: 24)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            email.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            email.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            email.heightAnchor.constraint(equalToConstant: 40),
            
            password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 20),
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            password.heightAnchor.constraint(equalToConstant: 40),
            
            addButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 120),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 150),
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    
    @objc func loginFunc() {
        
        print("Email: \(email.text ?? "")")
        print("Password: \(password.text ?? "")")

        let nextScreen = Logindetails()
//        nextScreen.delegate = self
        nextScreen.loginStatus = {
            status in
            self.statusLabel.text = status
        }
        nextScreen.loginDetails = "Email: \(email.text ?? ""),\n Password: \(password.text ?? "")"
        
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = .moveIn
        transition.subtype = .fromTop

        navigationController?.view.layer.add(transition, forKey: kCATransition)

        navigationController?.pushViewController(nextScreen, animated: false)

        email.text = ""
        password.text = ""
    }
    
    func displayLoginStatus(status: String) -> Void {
        
        statusLabel.text = status 
    }
}


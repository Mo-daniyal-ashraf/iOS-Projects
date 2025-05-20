//
//  ViewController.swift
//  loginPageWithStackView
//
//  Created by MdAshraf on 07/12/1946 Saka.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var conformPasswordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        

    }

    @IBAction func printDetails(_ sender: Any) {
        print("Email: \(emailTextField.text)")
        print("Email: \(passwordTextField.text)")
        print("Email: \(conformPasswordTextField.text)")
    }
    
}


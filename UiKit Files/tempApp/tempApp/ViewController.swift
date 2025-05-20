//
//  ViewController.swift
//  tempApp
//
//  Created by MdAshraf on 08/12/1946 Saka.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        email.layer.cornerRadius = 10
        password.layer.cornerRadius = 10
        loginButton.layer.cornerRadius = 10
    }


    @IBAction func printDetails(_ sender: Any) {
        
        print("------------------")
        print("Email: \(String(describing: email.text!))")
        print("Email: \(String(describing: password.text!))")
        email.text = ""
        password.text = ""
    }
    
    
}





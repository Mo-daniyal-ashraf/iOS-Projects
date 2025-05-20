//
//  ViewController.swift
//  Assessment_UI
//
//  Created by Mddaniyal on 3/7/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vieewContainer: UIView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var conformPassword: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        username.layer.borderWidth = 0.3
        email.layer.borderWidth = 0.3
        mobileNumber.layer.borderWidth = 0.3
        password.layer.borderWidth = 0.3
        conformPassword.layer.borderWidth = 0.3

        
        vieewContainer.layer.cornerRadius = 10
        
        signupBtn.layer.cornerRadius = 18
        signupBtn.clipsToBounds = true
    }

    @IBAction func signUp(_ sender: Any) {

        guard let usernameText = username.text, !usernameText.isEmpty,
              let emailText = email?.text, !emailText.isEmpty,
              let mobileText = mobileNumber?.text, !mobileText.isEmpty,
              let passwordText = password?.text, passwordText.count > 7,
              let confirmPasswordText = conformPassword?.text, passwordText == confirmPasswordText else {
            
            
            return
        }
        
        if let storyboard = storyboard?.instantiateViewController(withIdentifier: "UserProfileViewController") as? UserProfileViewController {
            
            storyboard.username = usernameText
            storyboard.email = emailText
            storyboard.modileNo = mobileText

            self.navigationController?.pushViewController(storyboard, animated: true)
        }
        
        username.text = ""
        email.text = ""
        mobileNumber.text = ""
        password.text = ""
        conformPassword.text = ""
    }
}


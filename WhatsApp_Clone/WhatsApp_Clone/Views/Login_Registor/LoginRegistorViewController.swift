//
//  LoginRegistorViewController.swift
//  WhatsApp_Clone
//
//  Created by Mddaniyal on 5/22/25.
//

import UIKit

class LoginRegistorViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var nextbutton: UIButton!
    
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        initialviewSetup()
    }
    
    
    // MARK: IBAction
    @IBAction func nextBtn(_ sender: UIButton) {
        
        let loginRegistor = LoginRegistorViewController(nibName: "LoginRegistorViewController", bundle: nil)
        self.navigationController?.pushViewController(loginRegistor, animated: true)
    }
}

extension LoginRegistorViewController {
    
    private func initialviewSetup() {
        
        nameTextField.delegate = self
        mobileNumberTextField.delegate = self
        emailTextField.delegate = self
        
        self.nextbutton.layer.cornerRadius = nextbutton.frame.height / 2
        navigationController?.isNavigationBarHidden = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
}


extension LoginRegistorViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if  textField.text == "Mobile Number" || textField.text == "Name" || textField.text == "Email" {
            
            textField.text = ""
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == mobileNumberTextField && mobileNumberTextField.text?.count == 0 {

            mobileNumberTextField.text = "Mobile Number"
            
        } else if textField == nameTextField && nameTextField.text?.count == 0  {
            
            nameTextField.text = "Name"
            
        } else if textField == emailTextField && emailTextField.text?.count == 0  {
            
            emailTextField.text = "Email"
        }
    }
}

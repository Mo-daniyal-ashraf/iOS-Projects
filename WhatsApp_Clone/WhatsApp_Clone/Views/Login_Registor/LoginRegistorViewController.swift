//
//  LoginRegistorViewController.swift
//  WhatsApp_Clone
//
//  Created by Mddaniyal on 5/22/25.
//

import UIKit
import RealmSwift

class LoginRegistorViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var nextbutton: UIButton!
    
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var allChats = List<Chat>()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        initialviewSetup()
    }
    
    
    // MARK: IBAction
    @IBAction func nextBtn(_ sender: UIButton) {
        
        saveAndCreateUser()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let tabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as? UITabBarController {
        
            if let chatVC = tabBarController.viewControllers?.first as? ChatViewController {
                
                chatVC.allChatDataSource = allChats
            }
            
            navigationController?.setViewControllers([tabBarController], animated: true)
        }
    }
    
    func saveAndCreateUser() {
        
        guard let name = nameTextField.text,
              let email = emailTextField.text,
              let mobileText = mobileNumberTextField.text,
              let mobileNumber = Int(mobileText) else {
            print("Invalid input")
            return
        }
        
        let user = User()
        user.name = name
        user.email = email
        user.mobileNumber = mobileNumber
        user.about = "Hi there, I am using Whatsapp!"
        
        do {
            let realm = try Realm()
            
            print("📂 Realm file path: \(realm.configuration.fileURL!)")
            
            if let existingUser = realm.objects(User.self).filter("mobileNumber == %@", mobileNumber).first {
                
                UserDefaults.standard.set(existingUser.id, forKey: "currentUserId")
                print("⚠️ User already exists with this mobile number.")
                return
            }
            
            try realm.write {
                
                realm.add(user)
            }
            print("User added successfully!")
            
        } catch let error {
            
            print(error.localizedDescription)
        }
        
        UserDefaults.standard.set(user.id, forKey: "currentUserId")
        
        print("User created!")
    }
}

extension LoginRegistorViewController {
    
    private func initialviewSetup() {
        
        nameTextField.delegate = self
        mobileNumberTextField.delegate = self
        emailTextField.delegate = self
        
        self.nextbutton.layer.cornerRadius = nextbutton.frame.height / 2
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

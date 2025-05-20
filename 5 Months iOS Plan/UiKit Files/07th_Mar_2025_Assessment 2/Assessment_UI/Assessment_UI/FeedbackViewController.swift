//
//  FeedbackViewController.swift
//  Assessment_UI
//
//  Created by Mddaniyal on 3/7/25.
//

import UIKit

class FeedbackViewController: UIViewController {

    var username: String = ""
    var email: String = ""
    var mobileNo: String = ""
    
    static func som() {
        print("ss")
    }
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var mobileNumbeerField: UITextField!
    @IBOutlet weak var messageField: UITextView!
    
    @IBOutlet weak var submitBtn: UIButton!
   
    @IBAction func submitAction(_ sender: Any) {
        
        let myaleert = UIAlertController(title: "Choose one option", message: "What you want to do", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) {
            _ in
            self.navigationController?.popViewController(animated: true)
        }
        let submit = UIAlertAction(title: "Submit", style: .default) {
            _ in
            self.navigationController?.popToRootViewController(animated: false)
        }
        
        myaleert.addAction(cancel)
        myaleert.addAction(submit)
        
        self.present(myaleert, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameField.layer.borderWidth = 0.3
        emailField.layer.borderWidth = 0.3
        mobileNumbeerField.layer.borderWidth = 0.3
        messageField.layer.borderWidth = 0.3
        
        
        usernameField.text = username
        emailField.text = email
        mobileNumbeerField.text = mobileNo
        submitBtn.layer.cornerRadius = 20
        submitBtn.clipsToBounds = true
    }
}

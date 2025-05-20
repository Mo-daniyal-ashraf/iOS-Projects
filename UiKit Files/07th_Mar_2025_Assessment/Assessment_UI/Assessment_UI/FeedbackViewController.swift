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
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var firstImg: UIView!
    @IBOutlet weak var firstInput: UITextField!

    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondImg: UIView!
    @IBOutlet weak var secondInput: UITextField!

    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var thirdImg: UIView!
    @IBOutlet weak var thirdInput: UITextField!
    
    @IBOutlet weak var messageField: UITextView!
    
    @IBOutlet weak var submitBtn: UIButton!
   
    @IBAction func submitAction(_ sender: Any) {
        
        guard let usernameText = firstInput.text, !usernameText.isEmpty,
              let emailText = secondInput?.text, !emailText.isEmpty,
              let mobileText = thirdInput?.text, !mobileText.isEmpty,
              let messageText = messageField.text, !messageText.isEmpty else {
            
            let alert = UIAlertController(
                title: "Please fill all fields",
                message: "All fields are required!",
                preferredStyle: .alert
            )
            
            let ok = UIAlertAction(title: "Okay", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
            return
        }
        
        let myaleert = UIAlertController(title: "Choose one option", message: "What you want to do", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "No", style: .destructive) {
            _ in
            self.navigationController?.popViewController(animated: true)
        }
        let submit = UIAlertAction(title: "Yes", style: .default) {
            _ in
            self.navigationController?.popToRootViewController(animated: false)
        }
        
        myaleert.addAction(cancel)
        myaleert.addAction(submit)
        
        self.present(myaleert, animated: true)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        styleInputView(view: firstView, imageView: firstImg)
        styleInputView(view: secondView, imageView: secondImg)
        styleInputView(view: thirdView, imageView: thirdImg)
        
        messageField.layer.borderWidth = 0.3
        
        messageField.layer.cornerRadius = 20
        messageField.clipsToBounds = true
       
        submitBtn.layer.cornerRadius = 20
        submitBtn.clipsToBounds = true
        
    }
    
    func styleInputView(view: UIView, imageView: UIView) {
        
        view.layer.borderWidth = 0.3
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = view.frame.height / 2
        
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
}

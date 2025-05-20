//
//  ViewController.swift
//  Assessment_UI
//
//  Created by Mddaniyal on 3/7/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vieewContainer: UIView!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var firstImg: UIView!
    @IBOutlet weak var firstInput: UITextField!
    
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondImg: UIView!
    @IBOutlet weak var secondInput: UITextField!
    
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var thirdImg: UIView!
    @IBOutlet weak var thirdInput: UITextField!

    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var fourthImg: UIView!
    @IBOutlet weak var fourthInput: UITextField!

    @IBOutlet weak var fifthView: UIView!
    @IBOutlet weak var fifthImg: UIView!
    @IBOutlet weak var fifthInput: UITextField!
        
    @IBOutlet weak var signupBtn: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        fourthInput.isSecureTextEntry = true
        fifthInput.isSecureTextEntry = true
        
        styleInputView(view: firstView, imageView: firstImg)
        styleInputView(view: secondView, imageView: secondImg)
        styleInputView(view: thirdView, imageView: thirdImg)
        styleInputView(view: fourthView, imageView: fourthImg)
        styleInputView(view: fifthView, imageView: fifthImg)
    
        signupBtn.layer.cornerRadius = 18
        signupBtn.clipsToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func showPassword(_ sender: Any) {
        
        fourthInput.isSecureTextEntry = false
        firstInput.isSecureTextEntry = false
    }
    
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
    func styleInputView(view: UIView, imageView: UIView) {
        
        view.layer.borderWidth = 0.3
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = view.frame.height / 2
        
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
    

    @IBAction func signUp(_ sender: Any) {

        guard let usernameText = firstInput.text, !usernameText.isEmpty,
              let emailText = secondInput?.text, !emailText.isEmpty,
              let mobileText = thirdInput?.text, !mobileText.isEmpty,
              let passwordText = fourthInput?.text,
              let confirmPasswordText = fifthInput?.text, !confirmPasswordText.isEmpty, passwordText == confirmPasswordText else {

            let alert = UIAlertController(
                title: "Please fill all fields",
                message: "All fields are required, and passwords must match.",
                preferredStyle: .alert
            )
            alert.popoverPresentationController?.backgroundColor
            
            let ok = UIAlertAction(title: "Okay", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
            return
        }

        
        if let storyboard = storyboard?.instantiateViewController(withIdentifier: "UserProfileViewController") as? UserProfileViewController {
            
            storyboard.username = usernameText
            storyboard.email = emailText
            storyboard.modileNo = mobileText

            self.navigationController?.pushViewController(storyboard, animated: true)
        }
      
        firstInput.text = ""
        secondInput.text = ""
        thirdInput.text = ""
        fourthInput.text = ""
        thirdInput.text = ""
    }
}


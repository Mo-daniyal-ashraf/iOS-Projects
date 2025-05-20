//
//  ViewController.swift
//  27_Feb_AppPractice
//
//  Created by MdAshraf on 08/12/1946 Saka.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var emailInput: UITextField!
    
    @IBOutlet weak var passwordinput: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.borderWidth = 2
        loginButton.layer.cornerRadius = 10
       
    }
    
    @IBAction func printDetails(_ sender: Any) {
        print("-----------------")
//        print("Email: \(emailInput.text)")
//        print("Email: \(passwordinput.text)")
    }
    
    
}






/*
 // for buttons
 myButton.setTitle("Hi", for: .normal)
 myButton.setTitleColor(.black, for: .normal)
 myButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
 myButton.backgroundColor = .green
 myButton.layer.cornerRadius = 10
 myButton.layer.borderWidth = 3
 myButton.layer.borderColor = UIColor.white.cgColor
 myButton.setBackgroundImage(UIImage(named: "apple"), for: .normal)
 
 // for labels
 
 label.text = "Hello"
 label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
 
 // input field
 myInput.placeholder = "Name"
 myInput.font = UIFont.systemFont(ofSize: 20)
 @IBOutlet weak var myInput: UITextField!
 
 
 
 @IBOutlet weak var label: UILabel!
 
 @IBAction func tappedButton(_ sender: Any) {
     print("button clicked")
     label.text = myInput.text
     istapped = istapped == true ? false : true
 }
 */

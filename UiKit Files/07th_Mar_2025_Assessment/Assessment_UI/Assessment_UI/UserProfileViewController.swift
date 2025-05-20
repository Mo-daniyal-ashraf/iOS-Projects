//
//  UserProfileViewController.swift
//  Assessment_UI
//
//  Created by Mddaniyal on 3/7/25.
//

import UIKit

class UserProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var username: String = "uaername"
    var email: String = "email"
    var modileNo: String = "990293433"
    
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
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    
    
    @IBOutlet weak var editView: UIView!
    
    @IBOutlet weak var menSwitchBtn: UISwitch!
    @IBOutlet weak var femaleSwitchBtn: UISwitch!

    
    @IBAction func showPassword(_ sender: Any) {
        
        fourthInput.isUserInteractionEnabled = false
        fourthInput.isUserInteractionEnabled = false
        print(9999)
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        firstInput.text = username
        secondInput.text = email
        thirdInput.text = modileNo
        
        firstInput.isUserInteractionEnabled = false
        secondInput.isUserInteractionEnabled = false
        thirdInput.isUserInteractionEnabled = false
        fourthInput.isUserInteractionEnabled = false
        menSwitchBtn.isUserInteractionEnabled = false
        femaleSwitchBtn.isUserInteractionEnabled = false
        
        styleInputView(view: firstView, imageView: firstImg)
        styleInputView(view: secondView, imageView: secondImg)
        styleInputView(view: thirdView, imageView: thirdImg)
        styleInputView(view: fourthView, imageView: fourthImg)
       

        saveBtn.layer.cornerRadius = 20
        saveBtn.clipsToBounds = true

        myImageView.layer.cornerRadius = myImageView.frame.width / 2
        myImageView.layer.masksToBounds = true
    
        titleLbl.text = username
        editView.layer.cornerRadius = editView.frame.height / 2
        
        myImageView.layer.cornerRadius = myImageView.frame.height / 2
        myImageView.clipsToBounds = true
      
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
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

    
    
    @IBAction func saveDetails(_ sdnder: UIButton) {
        
        guard let usernameText = firstInput.text, !usernameText.isEmpty,
              let emailText = secondInput?.text, !emailText.isEmpty,
              let mobileText = thirdInput?.text, !mobileText.isEmpty,
              let dobText = fourthInput?.text, !dobText.isEmpty,
              (menSwitchBtn.isOn || femaleSwitchBtn.isOn),
              !(menSwitchBtn.isOn && femaleSwitchBtn.isOn) else {
            let myaleert = UIAlertController(
                title: "Please fill all fields",
                message: "All fields are required, and you must select either male or female (not both).",
                preferredStyle: .alert
            )
            
            let ok = UIAlertAction(title: "Okay", style: .default)
            myaleert.addAction(ok)
            present(myaleert, animated: true)
            return
        }
        
        
        
        if let storyboard = storyboard?.instantiateViewController(withIdentifier: "FeedbackViewController") {
            
            self.navigationController?.pushViewController(storyboard, animated: true)
        }
    }

    
    @IBAction func eeditBtn(_ sender: Any) {
        
        firstInput.isUserInteractionEnabled = true
        secondInput.isUserInteractionEnabled = true
        thirdInput.isUserInteractionEnabled = true
        fourthInput.isUserInteractionEnabled = true
        menSwitchBtn.isUserInteractionEnabled = true
        femaleSwitchBtn.isUserInteractionEnabled = true
    }
    
    @IBAction func openImagePickerBtn(_ sender: Any) {
        
        let myImagePicker = UIImagePickerController()
        myImagePicker.delegate = self
        myImagePicker.sourceType = .photoLibrary
        myImagePicker.allowsEditing = true
        present(myImagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.editedImage] as? UIImage {
            myImageView.image = selectedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            myImageView.image = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

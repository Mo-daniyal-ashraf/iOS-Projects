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
    
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var usernmaeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        usernmaeTextField.layer.borderWidth = 0.3
        emailTextField.layer.borderWidth = 0.3
        mobileNumber.layer.borderWidth = 0.3
        dobTextField.layer.borderWidth = 0.3

        saveBtn.layer.cornerRadius = 20
        saveBtn.clipsToBounds = true

        myImageView.layer.cornerRadius = myImageView.frame.width / 2
        myImageView.layer.masksToBounds = true
        
        usernmaeTextField.text = username
        emailTextField.text = email
        mobileNumber.text = modileNo
        titleLbl.text = username
        myImageView.layer.cornerRadius = 50
    }
    
    
    
    @IBAction func saveDetails(_ sdnder: UIButton) {
                
        if let storyboard = storyboard?.instantiateViewController(withIdentifier: "FeedbackViewController") {
            
            self.navigationController?.pushViewController(storyboard, animated: true)
        }
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

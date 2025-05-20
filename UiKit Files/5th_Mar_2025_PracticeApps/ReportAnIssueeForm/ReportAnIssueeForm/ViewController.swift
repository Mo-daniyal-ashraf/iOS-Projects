//
//  ViewController.swift
//  ReportAnIssueeForm
//
//  Created by Mddaniyal on 3/5/25.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var issueBtn: UIButton!
    @IBOutlet var subjectTextField: UITextField!
    @IBOutlet var messageTextField: UITextView!

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        issueBtn.layer.borderWidth = 0.2
        subjectTextField.layer.borderWidth = 0.2
        messageTextField.layer.borderWidth = 0.2
        
        issueBtn.layer.cornerRadius = 5
        subjectTextField.layer.cornerRadius = 5
        messageTextField.layer.cornerRadius = 5
    
    }

    @IBAction func clearKeyboardBtn(_ sender: Any) {
        
        view.endEditing(false)
    }
    
    
    @IBAction func issueTypeBtn(_ sender: Any) {
        
        
        let actionAlert = UIAlertController(title: "Choose an Option", message: "", preferredStyle: .actionSheet)
        
        let issue1 = UIAlertAction(title: "Display related issues", style: .default) {
            _ in
            self.issueBtn.setTitle("Display related issues", for: .normal)
        }
        
        let issue2 = UIAlertAction(title: "Bettery related issues", style: .default) {
            _ in
            self.issueBtn.setTitle("Bettery related issues", for: .normal)
        }
        
        let issue3 = UIAlertAction(title: "Softwar related issues", style: .default) {
            _ in
            self.issueBtn.setTitle("Software related issues", for: .normal)

        }
        
        
        actionAlert.addAction(issue1)
        actionAlert.addAction(issue2)
        actionAlert.addAction(issue3)
        
        present(actionAlert, animated: false)
    }
    
    @IBAction func sendBtnTapped(_ sender: Any) {
        
        let actionAlert = UIAlertController(title: "Choose an Option", message: "How would you like to proceed?", preferredStyle: .actionSheet)
        
        let saveAction = UIAlertAction(title: "Save Draft", style: .default) {
            _ in
            print("Save Draft")
            self.imageView.image = nil
        }
        
        let submitAction = UIAlertAction(title: "Submit Form", style: .default) {
            _ in
            print("Submit Form")
            
            let displayVC = DisplayFormDataViewController()
            let navController = UINavigationController(rootViewController: displayVC)
            self.present(navController, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        actionAlert.addAction(saveAction)
        actionAlert.addAction(submitAction)
        actionAlert.addAction(cancelAction)
        
        present(actionAlert, animated: true)
    }
    
    
    // open photo Library
    @IBAction func imageePickerBtn(_ sender: Any) {
        
        let myImage = UIImagePickerController()
        myImage.sourceType = .photoLibrary
        myImage.delegate = self
        present(myImage, animated: true)
        
        print("clicked")
    }
    
    // Add thee image from photoLibrary to imageView
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])  {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
        }
        
        picker.dismiss(animated: true)
    }
    
    
}


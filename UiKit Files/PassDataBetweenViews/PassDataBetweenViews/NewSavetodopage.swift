//
//  NewSavetodopage.swift
//  PassDataBetweenViews
//
//  Created by MdAshraf on 09/12/1946 Saka.
//

import UIKit


class NewSavetodopage: UIViewController {
    
    
    @IBOutlet weak var inputField: UITextField!

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func handleButton() {
        
        print("hi")
        dismiss(animated: true, completion: nil)
    }
    
}










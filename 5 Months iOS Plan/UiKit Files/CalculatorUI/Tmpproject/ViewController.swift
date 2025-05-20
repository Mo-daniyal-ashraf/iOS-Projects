//
//  ViewController.swift
//  Tmpproject
//
//  Created by Mddaniyal on 3/3/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayLbl: UILabel!
    
    var expression: String = ""
    
    @IBAction func zeroBtnTapped(_ sender: Any) {
        
        expression += String(0)
        displayLbl?.text? += "0"
        print(0)
    }
    
    @IBAction func oneBtnTapped(_ sender: Any) {
        
        expression += String(1)
        displayLbl?.text? += "1"
        print(1)
        
    }
    
    @IBAction func twoBtnTapped(_ sender: Any) {
        
        expression += String(2)
        displayLbl?.text? += "2"
        print(1)
    }
    
    @IBAction func threeBtnTapped(_ sender: Any) {
        
        expression += String(3)
        displayLbl?.text? += "3"
        print(3)
    }

    @IBAction func fourBtnTapped(_ sender: Any) {
        
        expression += String(4)
        displayLbl?.text? += "4"
        print(4)
    }

    @IBAction func fiveBtnTapped(_ sender: Any) {
        
        expression += String(5)
        displayLbl?.text? += "5"
        print(5)
    }

    @IBAction func sixBtnTapped(_ sender: Any) {
        
        expression += String(6)
        displayLbl?.text? += "6"
        print(6)
    }

    @IBAction func sevenBtnTapped(_ sender: Any) {
        
        expression += String(7)
        displayLbl?.text? += "7"
        print(7)
    }

    @IBAction func eightBtnTapped(_ sender: Any) {
        
        expression += String(8)
        displayLbl?.text? += "8"
        print(8)
    }

    @IBAction func nineBtnTapped(_ sender: Any) {
        
        expression += String(9)
        displayLbl?.text? += "9"
        print(9)
    }
    
    @IBAction func equalBtnTapped(_ sender: Any) {
        
        print(Int("31"))
    }


    override func viewDidLoad() {
        
        super.viewDidLoad()

    }


}


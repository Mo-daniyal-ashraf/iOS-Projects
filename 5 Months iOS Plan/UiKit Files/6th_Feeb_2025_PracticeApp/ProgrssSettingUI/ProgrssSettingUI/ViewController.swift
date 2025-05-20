//
//  ViewController.swift
//  ProgrssSettingUI
//
//  Created by Mddaniyal on 3/6/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var deveeloprSettingsViw: UIView!
    @IBOutlet weak var generalSettingsVieew: UIView!
    var isSwitchBtnClicked = false
    
    @IBOutlet weak var base64Btn: UIButton!
    @IBOutlet weak var streamBtn: UIButton!
    
    @IBOutlet weak var maxLbl: UILabel!
    @IBOutlet weak var minLbl: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        deveeloprSettingsViw.layer.cornerRadius = 10
        deveeloprSettingsViw.layer.borderWidth = 0.1
        generalSettingsVieew.layer.cornerRadius = 10
        generalSettingsVieew.layer.borderWidth = 0.1
        base64Btn.layer.cornerRadius = 5
        streamBtn.layer.cornerRadius = 5
    }

    
    @IBAction func uploadMeethodsSwitch(_ sender: UISwitch) {
        
        DispatchQueue.main.async {
            if sender.isOn {
                
                self.base64Btn.layer.backgroundColor = UIColor.gray.cgColor
                self.streamBtn.layer.backgroundColor = UIColor.blue.cgColor
            } else {
                
                self.base64Btn.layer.backgroundColor = UIColor.blue.cgColor
                self.streamBtn.layer.backgroundColor = UIColor.gray.cgColor
            }
        }
    }
    
    
    @IBAction func firstSliderDidSlidee(_ sender: UISlider) {
        
        let formattedValue = String(format: "%.2f", sender.value)
        maxLbl.text = "Max Threshold: \(formattedValue)"
        print(formattedValue)
    }
    
    @IBAction func secondSliderDidSlidee(_ sender: UISlider) {
         
        let formattedValue = String(format: "%.2f", sender.value)
        minLbl.text = "Max Threshold: \(formattedValue)"
        print(formattedValue)
    }
    
}


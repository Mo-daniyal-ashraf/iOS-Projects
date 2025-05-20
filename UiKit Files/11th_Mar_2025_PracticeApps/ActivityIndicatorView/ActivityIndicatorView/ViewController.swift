//
//  ViewController.swift
//  ActivityIndicatorView
//
//  Created by Mddaniyal on 3/11/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var activityControl: UIActivityIndicatorView!
    
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var btnLbl: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

//    override func viewWillAppear(_ animated: Bool) {
//
//        activityControl.startAnimating()
//        lbl.text = "Animation started"
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//
//        do {
//            sleep(4)
//        }
//        activityControl.stopAnimating()
//        activityControl.hidesWhenStopped = true
//        lbl.text = "Animation stopped"
//    }
    
    @IBAction func startStopAnimation(_ sender: Any) {
        
        if activityControl.isAnimating == false {
            
            activityControl.startAnimating()
            lbl.text = "Animation started"
            btnLbl.setTitle("Stop", for: .normal)
        } else {
            
            activityControl.stopAnimating()
            lbl.text = "Animation stopped"
            btnLbl.setTitle("Start", for: .normal)
        }
    }
    
}


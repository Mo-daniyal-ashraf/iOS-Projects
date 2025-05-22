//
//  WelcomeScreenViewController.swift
//  WhatsApp_Clone
//
//  Created by Mddaniyal on 5/22/25.
//

import UIKit

class WelcomeScreenViewController: UIViewController {

    
    // MARK: IBOutlet
    @IBOutlet weak var nextbutton: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        initialviewSetup()
    }
    
    
    // MARK: IBAction
    @IBAction func nextBtn(_ sender: UIButton) {
        
        let loginRegistor = LoginRegistorViewController(nibName: "LoginRegistorViewController", bundle: nil)
        self.navigationController?.pushViewController(loginRegistor, animated: true)
    }
}

extension WelcomeScreenViewController {
    
    private func initialviewSetup() {
        
        self.nextbutton.layer.cornerRadius = nextbutton.frame.height / 2
//        navigationController?.isNavigationBarHidden = true
    }
}

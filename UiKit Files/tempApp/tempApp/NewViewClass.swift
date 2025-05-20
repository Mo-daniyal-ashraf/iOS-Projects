//
//  NewViewClass.swift
//  tempApp
//
//  Created by MdAshraf on 08/12/1946 Saka.
//

import UIKit

class NewViewClass: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("new view")
        var newView = UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
        
        newView.backgroundColor = .red
        var lebel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
        lebel.numberOfLines = 2
        lebel.backgroundColor = .green
        lebel.text = "This is sample label"
        newView.addSubview(lebel)
        
        view.addSubview(newView)
    }
    
}


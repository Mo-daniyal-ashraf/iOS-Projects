//
//  ViewController.swift
//  SampleProject
//
//  Created by Mddaniyal on 3/10/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var seg: UISegmentedControl!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func selectImg(_ sender: Any) {
        
        if seg.selectedSegmentIndex == 0 {
            lbl.text = "First Image"
            img.image = UIImage(named: "first")
            print("1")
        } else if seg.selectedSegmentIndex == 0 {
            lbl.text = "second Image"
            img.image = UIImage(named: "seecond")
            print("1")
        } else if seg.selectedSegmentIndex == 0 {
            lbl.text = "third Image"
            img.image = UIImage(named: "third")
            print("1")
        } else if seg.selectedSegmentIndex == 0 {
            lbl.text = "fourth Image"
            img.image = UIImage(named: "fourth")
            print("1")
        }
    }
    
}


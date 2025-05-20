//
//  ViewController.swift
//  CustomCellClassProject
//
//  Created by Mddaniyal on 3/4/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var toplab: UILabel!
    
    @IBOutlet weak var myTabl: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        myTabl.register(UINib(nibName: "CustomTableCell", bundle: nil), forCellReuseIdentifier: "CustomTableCell")

        myTabl.dataSource = self
        myTabl.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTabl.dequeueReusableCell(withIdentifier: "CustomTableCell") as? CustomTableCell
        cell?.layer.cornerRadius = 10
        print(indexPath.row)
        cell?.bobLab.text! += "                                          " + String(indexPath.row+1)
        cell?.dataToSend = { titleText in
            self.toplab.text! = titleText
        }
        
        return cell ?? UITableViewCell(frame: .zero )
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }

}


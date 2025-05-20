//
//  ViewController.swift
//  UITableVieweeProject2
//
//  Created by Mddaniyal on 3/4/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    

    let data: [String] = [
        "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh",
        "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand",
        "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur",
        "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab",
        "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura",
        "Uttar Pradesh", "Uttarakhand", "West Bengal",
    ]
    
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        
        myTable.dataSource = self
        myTable.delegate = self
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Arunachal Pradesh"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var selectedCell: UITableViewCell = myTable.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.blue
    }

}


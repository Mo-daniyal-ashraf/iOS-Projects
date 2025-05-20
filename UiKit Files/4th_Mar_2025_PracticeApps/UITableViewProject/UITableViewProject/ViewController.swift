//
//  ViewController.swift
//  UITableViewProject
//
//  Created by Mddaniyal on 3/4/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    struct ProductINfo {
        
        var imageeName: String
        var title: String
    }
    
    var data: [ProductINfo] = [
        ProductINfo(imageeName: "img1", title: "This is image of a wallpapper"),
        ProductINfo(imageeName: "img2", title: "This is image of a keyboard"),
        ProductINfo(imageeName: "img3", title: "This is image of a laptop"),
        ProductINfo(imageeName: "img4", title: "This is image of a mountain"),
        ProductINfo(imageeName: "img5", title: "This is image of a shoose"),
        ProductINfo(imageeName: "img6", title: "This is image of sea"),
        ProductINfo(imageeName: "img7", title: "This is image of lal qila")
    ]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        table.sectionHeaderHeight = 10
        table.sectionFooterHeight = 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let prod = data[indexPath.row]
        
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableeViweCell
        cell?.myImageView.image = UIImage(named: prod.imageeName)
        cell?.label.text = prod.title
        
        cell?.myImageView.layer.cornerRadius = (cell?.myImageView.frame.height ?? 120) / 3
        return cell ?? UITableViewCell(frame: .zero)
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 144
    }
}


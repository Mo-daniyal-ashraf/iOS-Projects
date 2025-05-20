//
//  FilterViewController.swift
//  SampleProject
//
//  Created by Mddaniyal on 3/18/25.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let dataSourcee = ["Image", "Photo", "Image", "Photo", "Image", "Photo", "Image", "Photo", "Image", "Photo"]

    @IBOutlet weak var clearFilterBtn: UIButton!
    
    @IBOutlet weak var filterTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrowtriangle.backward.fill"),
            style: .done,
            target: self,
            action: #selector(backTapped)
        )
        
        filterTable.delegate = self
        filterTable.dataSource = self
        
        let nib = UINib.init(nibName: "FilterTableViewCell", bundle: nil)
        filterTable.register(nib, forCellReuseIdentifier: "FilterTableViewCell")
        clearFilterBtn.layer.cornerRadius = clearFilterBtn.frame.height / 2
    }
    
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension FilterViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSourcee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = dataSourcee[indexPath.row]
        
        let cell = filterTable.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as? FilterTableViewCell
        
        cell?.filterType.text = row
        cell?.icon.image = UIImage(systemName: "star.fill")
        return cell!
    }
    
}

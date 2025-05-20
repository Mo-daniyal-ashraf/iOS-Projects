//
//  ViewController.swift
//  SampleProject
//
//  Created by Mddaniyal on 3/18/25.
//

import UIKit

struct Post {
    
    var title: String
    var profileImg: String
    var descrip: String
    var postedImg: String
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var filterView: UIView!
    
    @IBOutlet weak var myTable: UITableView!
    
    @IBOutlet weak var startBtnView: UIView!
    
    
    var dataSource = [
        Post(title: "Mohd daniyal", profileImg: "profileImg", descrip: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do ", postedImg: "profileImg"),
        Post(title: "Mohd daniyal", profileImg: "profileImg", descrip: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do ", postedImg: "profileImg"),
        Post(title: "Mohd daniyal", profileImg: "profileImg", descrip: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do ", postedImg: "profileImg"),
        Post(title: "Mohd daniyal", profileImg: "profileImg", descrip: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do ", postedImg: "profileImg"),
        Post(title: "Mohd daniyal", profileImg: "profileImg", descrip: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do ", postedImg: "profileImg"),
        Post(title: "Mohd daniyal", profileImg: "profileImg", descrip: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do ", postedImg: "profileImg"),
        Post(title: "Mohd daniyal", profileImg: "profileImg", descrip: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do ", postedImg: "profileImg"),
        Post(title: "Mohd daniyal", profileImg: "profileImg", descrip: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do ", postedImg: "profileImg"),
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        myTable.delegate = self
        myTable.dataSource = self
        
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
        searchView.layer.cornerRadius = searchView.frame.height / 2
        filterView.layer.cornerRadius = filterView.frame.height / 2
        
        let nib = UINib.init(nibName: "CustomTableViewCell", bundle: nil)
        
        myTable.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        
        startBtnView.layer.cornerRadius = startBtnView.frame.height / 2
    }
    
   
    @IBAction func filterBtnTapped(_ sender: Any) {
        
        if let filterVC = storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as? FilterViewController {
            self.navigationController?.pushViewController(filterVC, animated: true)
        }
    }
    
    
    @IBAction func startBtnTapped(_ sender: Any) {
        
        let shareVc = ShareViewController()
        shareVc.modalPresentationStyle = .fullScreen
        present(shareVc, animated: true)
    }
    
}


extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = dataSource[indexPath.row]
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell
        
        cell?.title.text = row.title
        cell?.profileImg.image = UIImage(named: row.profileImg)
        cell?.descrip.text = row.descrip
        cell?.postImg.image = UIImage(named: row.postedImg)
        
        return cell! 
    }
}

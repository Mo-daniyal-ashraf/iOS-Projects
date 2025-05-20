//
//  ViewController.swift
//  UISerarchBar
//
//  Created by Mddaniyal on 3/11/25.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating {
    
    

    let searchContoller = UISearchController()
    
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.title = "Search"
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: nil)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: nil)
//
        navigationItem.searchController = searchContoller
        searchContoller.searchResultsUpdater = self
        searchContoller.searchBar.placeholder = "Search here"
        searchContoller.searchBar.showsCancelButton = false
//        searchContoller.searchBar.showsSearchResultsButton = true
//        searchContoller.searchBar.resignFirstResponder()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
        lbl.text = text
//        lbl.text = text
    }


}


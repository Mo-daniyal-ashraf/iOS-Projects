//
//  ViewController.swift
//  WhatsApp_Clone
//
//  Created by Mddaniyal on 5/22/25.
//

import UIKit
import RealmSwift

class ChatViewController: UIViewController {

    // MARK: I
    
    @IBOutlet weak var tableView: UITableView!
    
    var allChatDataSource: [Chat] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        inittialViewSetup()
    }
    
    @IBAction func logOutBtn(_ sender: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "currentUserId")
    }
    
}

extension ChatViewController {
    
    private func inittialViewSetup() {
        
        navigationController?.isNavigationBarHidden = true
        tableView.dataSource = self
        tableView.dataSource = self
        tableView.rowHeight = 74
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
    }
}


extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allChatDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let chat = allChatDataSource[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as? ChatTableViewCell
        cell?.configuewCell(with: chat)
        
        return cell!
    }
}


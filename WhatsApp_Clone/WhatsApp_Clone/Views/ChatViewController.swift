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
    
    var allChatDataSource = List<Chat>()
    
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
        
        getAllChats()
        navigationController?.isNavigationBarHidden = true
        tableView.dataSource = self
        tableView.dataSource = self
        tableView.rowHeight = 74
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
    }
    
    private func getAllChats() {
        
        guard let currentUserId = UserDefaults.standard.string(forKey: "currentUserId") else {
            print("No current user ID found in UserDefaults")
            return
        }
        
        do {
            let realm = try Realm()
            
            let user = realm.object(ofType: User.self, forPrimaryKey: currentUserId)
            allChatDataSource = user!.chats
        } catch let error {
            
            print(error.localizedDescription)
        }
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


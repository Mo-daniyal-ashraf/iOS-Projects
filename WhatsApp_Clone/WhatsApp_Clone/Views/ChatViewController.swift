//
//  ViewController.swift
//  WhatsApp_Clone
//
//  Created by Mddaniyal on 5/22/25.
//

import UIKit
import RealmSwift



class ChatViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addChatView: UIView!
    
    var allChatDataSource = List<Chat>()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        inittialViewSetup()
    }
    
    @IBAction func logOutBtn(_ sender: UIButton) {

        UserDefaults.standard.removeObject(forKey: "currentUserId")
    }
    
    
    @IBAction func addChatBtn(_ sender: Any) {
        
        let addVC = AddUserViewController(nibName: "AddUserViewController", bundle: nil)
        addVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addVC, animated: true)
    }
}




extension ChatViewController {
    
    private func inittialViewSetup() {
        
        getAllChats()
        navigationController?.isNavigationBarHidden = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 74
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        self.addChatView.layer.cornerRadius = addChatView.frame.height / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
    }
    
    private func getAllChats() {
        
        guard let currentUserId = UserDefaults.standard.string(forKey: "currentUserId") else {
            print("No current user ID found in UserDefaults")
            return
        }
        
        do {
            let realm = try Realm()
            print(realm.configuration.fileURL)
            guard let user = realm.object(ofType: User.self, forPrimaryKey: currentUserId) else {
                
                print("User not found for display chats!")
                return
            }
            allChatDataSource = user.chats
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
        cell?.configuewCellWithChat(with: chat)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
        let chat = allChatDataSource[indexPath.row]
        
        let detailedVC = DetaildViewController(nibName: "DetaildViewController", bundle: nil)
        detailedVC.hidesBottomBarWhenPushed = true
        detailedVC.chatDetails = chat
        
        self.navigationController?.pushViewController(detailedVC, animated: true)
    }
}


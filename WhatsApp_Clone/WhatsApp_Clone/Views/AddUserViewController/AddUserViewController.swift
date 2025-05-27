//
//  AddUserViewController.swift
//  WhatsApp_Clone
//
//  Created by Mddaniyal on 5/26/25.
//

import UIKit
import RealmSwift

class AddUserViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var allUserDataSource: Results<User>?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        inittialViewSetup()
        let currUserId = RealmHelper.getCurrentUserId()
        let allUsers = RealmHelper.getAllData(ofType: User.self)
        let filteredUsers = allUsers.filter("id != %@", currUserId)
        allUserDataSource = filteredUsers
    }
}



extension AddUserViewController {
    
    private func inittialViewSetup() {
        
        navigationController?.isNavigationBarHidden = false
        tableView.dataSource = self
        tableView.delegate = self

        tableView.rowHeight = 74
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
    }
}




extension AddUserViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allUserDataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let user = allUserDataSource?[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as? ChatTableViewCell
        cell?.configuewCellWithUSer(with: user!)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let realm = RealmHelper.shared
        
        let user1Id = RealmHelper.getCurrentUserId()
        guard let user2Id = allUserDataSource?[indexPath.row].id else {
            print("new chat creation failed!")
            return
        }
        
        let existingChat = realm.objects(Chat.self).first {
            ($0.user1Id == user1Id && $0.user2Id == user2Id) ||
            ($0.user1Id == user2Id && $0.user2Id == user1Id)
        }
        
        if existingChat != nil {
            print("Chat already exists")

            let detailedVC = DetaildViewController(nibName: "DetaildViewController", bundle: nil)
            detailedVC.hidesBottomBarWhenPushed = true
            detailedVC.chatDetails = existingChat
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as? UITabBarController
            
            self.navigationController?.pushViewController(tabBarController!, animated: false)
            self.navigationController?.pushViewController(detailedVC, animated: false)
            
            return
        }
        
        
        let newChat = Chat()
        newChat.user1Id = user1Id
        newChat.user2Id = user2Id
        
        
        guard let user1 = realm.object(ofType: User.self, forPrimaryKey: user1Id),
              let user2 = realm.object(ofType: User.self, forPrimaryKey: user2Id) else {
            print("One or both users not found in Realm")
            return
        }
        
        do {
            try realm.write {
                realm.add(newChat)
                user1.chats.append(newChat)
                user2.chats.append(newChat)
            }
            print("New chat successfully created and added to both users.")
        } catch {
            print("Error saving chat: \(error.localizedDescription)")
        }
    }
}


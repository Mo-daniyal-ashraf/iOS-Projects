//
//  DetaildViewController.swift
//  WhatsApp_Clone
//
//  Created by Mddaniyal on 5/26/25.
//

import UIKit

class DetaildViewController: UIViewController {

    var chatDetails: Chat?
    
    @IBOutlet weak var chatusername: UILabel!
    @IBOutlet weak var audioView: UIView!
    @IBOutlet weak var inputBoxView: UIView!
    @IBOutlet weak var inputFextField: UITextField!
    @IBOutlet weak var sendBtnImgView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var audioBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        initialViewSetUp()
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func sendMessageBtn(_ sender: UIButton) {
        
        guard let chatDetails = chatDetails else {
            
            print("chatDetails is empty!")
            return
        }
        
        guard let messageText = inputFextField.text else {
            
            print("Message empty!")
            return
        }
        
        guard let sender = RealmHelper.getUserbyId(id: chatDetails.user1Id),
              let reciever = RealmHelper.getUserbyId(id: chatDetails.user2Id) else {
            
            print("One or both users not found in Realm")
            return
        }
        
        let message = Message()
        message.chatId = chatDetails.id
        message.senderId = sender.id
        message.receiverId = reciever.id
        message.text = messageText
        message.sentAt = Date()
        message.isSeen = false
        
        do {
            let realm = RealmHelper.shared
            
            try realm.write {
                
                chatDetails.messages.append(message)
                chatDetails.lastMessage = message.text
                chatDetails.lastMessageTime = message.sentAt
                
                realm.add(message)
                inputFextField.text = ""
                dismissKeyboard()
            }
            
        } catch  {
            print("Saome error while saveing message!")
        }
        
        self.tableView.reloadData()
    }
}



extension DetaildViewController {
    
    private func initialViewSetUp() {
     
        guard let chatDetails = chatDetails else {
            
            print("chatDetailschatDetails is not found")
            return
        }
        
        self.navigationController?.isNavigationBarHidden = true
        
        if RealmHelper.getCurrentUserId() == chatDetails.user1Id {
            
            self.chatusername.text = RealmHelper.getUserbyId(id: chatDetails.user2Id)?.name
        } else {
            
            self.chatusername.text = RealmHelper.getUserbyId(id: chatDetails.user1Id)?.name
        }
        
        inputBoxView.layer.cornerRadius = inputBoxView.frame.height / 2
        audioView.layer.cornerRadius = audioView.frame.height / 2
        inputFextField.delegate = self
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        inputFextField.attributedPlaceholder = NSAttributedString(
            string: "Message",
            attributes: [
                .foregroundColor: UIColor.lightGray
            ]
        )
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "RightMessageTableViewCell", bundle: nil), forCellReuseIdentifier: "RightMessageTableViewCell")
        self.tableView.register(UINib(nibName: "LeftMessageTableViewCell", bundle: nil), forCellReuseIdentifier: "LeftMessageTableViewCell")
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
        bottomConstraint.constant = 0
        audioBottomConstraint.constant = 0
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let height = keyboardFrame.height
            bottomConstraint.constant = height * -1
            audioBottomConstraint.constant = height * -1
        }
    }
}



extension DetaildViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if textField.text?.count != 0 {
            
            sendBtnImgView.image = UIImage(named: "send.arrow")

        } else {
            
            sendBtnImgView.image = UIImage(systemName: "mic.fill")
        }
    }
}


extension DetaildViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatDetails?.messages.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let message = chatDetails?.messages[indexPath.row] else {
            return UITableViewCell()
        }

        guard let currentUserId = UserDefaults.standard.string(forKey: "currentUserId") else {
            print("⚠️ currentUserId not found in UserDefaults")
            return UITableViewCell()
        }
        
        if message.senderId == currentUserId {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RightMessageTableViewCell", for: indexPath) as! RightMessageTableViewCell
            cell.configureCell(with: message)
            cell.selectionStyle = .none
            return cell
        } else {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "LeftMessageTableViewCell", for: indexPath) as! LeftMessageTableViewCell
            cell.configureCell(with: message)
            cell.selectionStyle = .none
            return cell
        }
    }

}

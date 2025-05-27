//
//  ChatTableViewCell.swift
//  WhatsApp_Clone
//
//  Created by Mddaniyal on 5/23/25.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var nameOrPhonelabel: UILabel!
    @IBOutlet weak var lastMessageTimeLbl: UILabel!
    @IBOutlet weak var lastMessageTextLbl: UILabel!
    
    @IBOutlet weak var newMessageBubbleView: UIView!
    @IBOutlet weak var numberUnseenMessageLbl: UILabel!
    
    
    var chatDetails: Chat?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
}



extension ChatTableViewCell {
    
    private func initialCellSetUp() {
        
        self.newMessageBubbleView.layer.cornerRadius = newMessageBubbleView.frame.height / 2
        handleUnSeenMessageBubble()
    }
    
    func handleUnSeenMessageBubble() {
        
        var unSeenMessageCount = 0
        
        guard let chatDetails = chatDetails else {
            
            print("chatDetails is empty")
            return
        }
        
        for message in chatDetails.messages {
            
            if message.isSeen == false && message.senderId != RealmHelper.getCurrentUserId() {
                
                unSeenMessageCount += 1
            }
        }

        
        if unSeenMessageCount != 0 {
            
            numberUnseenMessageLbl.text = String(unSeenMessageCount)
            lastMessageTimeLbl.textColor = UIColor(red: 37/255, green: 211/255, blue: 102/255, alpha: 1.0)
        } else {
            
            newMessageBubbleView.isHidden = true
            lastMessageTimeLbl.textColor = UIColor(red: 146/255, green: 151/255, blue: 154/255, alpha: 1.0)
        }
    }
    
    func configuewCellWithChat(with chat: Chat) {
        
        initialCellSetUp()
        self.lastMessageTextLbl.text = chat.lastMessage?.count == 0 ? "No message yet" : chat.lastMessage
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let formattedTime = formatter.string(from: chat.lastMessageTime ?? Date())
        self.lastMessageTimeLbl.text =  formattedTime
        
        if RealmHelper.getCurrentUserId() == chat.user1Id {
            
            self.nameOrPhonelabel.text = RealmHelper.getUserbyId(id: chat.user2Id)?.name ?? "No name"
        } else {
            self.nameOrPhonelabel.text = RealmHelper.getUserbyId(id: chat.user1Id)?.name ?? "No name"
        }
    }
    
    func configuewCellWithUSer(with user: User) {
        
        self.lastMessageTextLbl.text = user.about
        self.lastMessageTimeLbl.text = "00"
        self.nameOrPhonelabel.text = user.name
    }
}

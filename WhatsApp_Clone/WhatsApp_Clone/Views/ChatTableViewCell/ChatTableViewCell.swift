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
    
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
}



extension ChatTableViewCell {
    
    func configuewCellWithChat(with chat: Chat) {
        
        self.lastMessageTextLbl.text = chat.lastMessage?.count == 0 ? "No message yet" : chat.lastMessage
        self.lastMessageTimeLbl.text =  "12:23 NM"
        
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

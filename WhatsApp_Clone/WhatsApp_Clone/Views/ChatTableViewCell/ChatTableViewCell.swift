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
    
    func configuewCell(with chat: Chat) {
        
        self.lastMessageTextLbl.text = chat.lastMessage
        self.lastMessageTimeLbl.text =  "12:23 NM"
        self.nameOrPhonelabel.text = chat.user2Id
    }
}

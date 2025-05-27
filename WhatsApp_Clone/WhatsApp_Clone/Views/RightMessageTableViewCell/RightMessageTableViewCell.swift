//
//  LeftMessageTableViewCell.swift
//  WhatsApp_Clone
//
//  Created by Mddaniyal on 5/26/25.
//

import UIKit


class RightMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var messageTextField: UILabel!
    @IBOutlet weak var timeTextField: UILabel!
    @IBOutlet weak var messageContainerView: UIView!
    @IBOutlet weak var messageContainerOuterStackView: UIStackView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        initialCellSetUp()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
}



extension RightMessageTableViewCell {
    
    private func initialCellSetUp() {
        
        messageContainerView.layer.cornerRadius = 10
    }
}



extension RightMessageTableViewCell {
    
    func configureCell(with message: Message) {
        
        self.messageTextField.text = message.text
        
        let date = message.sentAt
        print(date)
        self.timeTextField.text = "12:00 AM"
        // 2025-05-27 07:42:40 +0000
    }
}

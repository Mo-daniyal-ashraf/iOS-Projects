//
//  LeftMessageTableViewCell.swift
//  WhatsApp_Clone
//
//  Created by Mddaniyal on 5/27/25.
//

import UIKit

class LeftMessageTableViewCell: UITableViewCell {

    
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



extension LeftMessageTableViewCell {
    
    private func initialCellSetUp() {
        
        messageContainerView.layer.cornerRadius = 10
    }
}



extension LeftMessageTableViewCell {
    
    func configureCell(with message: Message) {
        
        self.messageTextField.text = message.text
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let formattedTime = formatter.string(from: message.sentAt)
        self.timeTextField.text = formattedTime
    }
}

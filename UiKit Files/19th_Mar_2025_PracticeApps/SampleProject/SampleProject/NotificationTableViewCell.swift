//
//  NotificationTableViewCell.swift
//  SampleProject
//
//  Created by Mddaniyal on 3/19/25.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationImg: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        notificationImg.layer.cornerRadius = frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

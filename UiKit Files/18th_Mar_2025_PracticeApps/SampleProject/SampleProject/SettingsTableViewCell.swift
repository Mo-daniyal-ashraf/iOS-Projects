//
//  SettingsTableViewCell.swift
//  SampleProject
//
//  Created by Mddaniyal on 3/19/25.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var settingTypeIcon: UIImageView!
    @IBOutlet weak var settingName: UILabel!
    
    @IBOutlet weak var iconWidthCons: NSLayoutConstraint!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
    
    func setUpSecondSection() {
        
        settingTypeIcon.isHidden = true
        settingName.textColor = .blue
        iconWidthCons.constant = 0
    }
    
    
}

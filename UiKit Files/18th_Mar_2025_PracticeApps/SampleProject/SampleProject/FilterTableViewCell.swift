//
//  FilterTableViewCell.swift
//  SampleProject
//
//  Created by Mddaniyal on 3/18/25.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var filterType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

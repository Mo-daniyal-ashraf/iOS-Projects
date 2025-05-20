//
//  CustomTableCell.swift
//  CustomCellClassProject
//
//  Created by Mddaniyal on 3/4/25.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var bobLab: UILabel!
    var dataToSend: ((String) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

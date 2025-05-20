//
//  CustomTableViewCell.swift
//  SampleProject
//
//  Created by Mddaniyal on 3/18/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var descrip: UITextView!
    
    @IBOutlet weak var postImg: UIImageView!
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var profileImgVuiew: UIImageView!
    @IBOutlet weak var postImgView: UIImageView!
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        outerView.layer.cornerRadius = 15
        outerView.layer.borderWidth = 0.3
        outerView.layer.borderColor = UIColor.black.cgColor
        
        profileImgVuiew.layer.cornerRadius = profileImgVuiew.frame.height / 2
        
        postImgView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

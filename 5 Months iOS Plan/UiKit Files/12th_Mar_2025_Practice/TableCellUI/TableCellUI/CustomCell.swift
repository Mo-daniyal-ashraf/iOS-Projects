//
//  CustomCell.swift
//  TableCellUI
//
//  Created by Mddaniyal on 3/12/25.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func didTapButton(cell: CustomCell)
}


class CustomCell: UITableViewCell {

    @IBOutlet weak var imgView: UIView!
    
    @IBOutlet weak var myImg: UIImageView!
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var rowView: UIView!

    @IBOutlet weak var ageLbl: UILabel!
    
    weak var delegate: CustomCellDelegate?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        button.layer.cornerRadius = button.frame.height / 2
        button.clipsToBounds = true
        imgView.layer.cornerRadius = imgView.frame.height / 2
    }
    
    @IBAction func btnTapped(_ sender: Any) {
        
        delegate?.didTapButton(cell: self)
        self.rowView.layer.borderWidth = 3
        self.rowView.layer.borderColor = UIColor.red.cgColor
        print("tapped")
    }
    
}


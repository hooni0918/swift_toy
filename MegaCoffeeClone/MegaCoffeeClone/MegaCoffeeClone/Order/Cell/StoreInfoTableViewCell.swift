//
//  StoreInfoTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/05.
//

import UIKit

class StoreInfoTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    
    @IBOutlet var storeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        storeImageView.layer.cornerRadius = 0.5 * storeImageView.frame.size.width
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

//
//  StoreMapTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/05.
//

import UIKit
import MapKit

class StoreMapTableViewCell: UITableViewCell {
    
    
    @IBOutlet var storeMapView: MKMapView!
    @IBOutlet var currentLocationButton: UIView!
    @IBOutlet var storeInfoView: UIView!
    @IBOutlet var storeImageView: UIImageView!
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var orderButton: UIButton!
    @IBOutlet var storeInfoViewHeight: NSLayoutConstraint!
    
    var isTouch = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        currentLocationButton.layer.cornerRadius = 0.5 * currentLocationButton.frame.height
        storeInfoView.layer.cornerRadius = 15
        storeInfoView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        storeImageView.layer.cornerRadius = 0.5 * storeImageView.frame.height
        closeButton.layer.cornerRadius = 10
        orderButton.layer.cornerRadius = 10
        
        storeInfoViewHeight.constant = 0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func tapCurrentLocationButton(_ sender: Any) {
        isTouch.toggle()
        
        if isTouch {
            storeInfoViewHeight.constant = storeMapView.frame.height * 0.35
        } else {
            storeInfoViewHeight.constant = 0
        }
    }
    
    @IBAction func tapCloseButton(_ sender: Any) {
        tapCurrentLocationButton(sender)
    }
}

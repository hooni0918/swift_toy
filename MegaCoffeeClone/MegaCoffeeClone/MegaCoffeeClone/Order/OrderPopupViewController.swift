//
//  OrderpopViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/06.
//

import UIKit

class OrderPopupViewController: UIViewController {

    @IBOutlet var popView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popView.clipsToBounds = true
        popView.layer.cornerRadius = 20
        
    }
    
    @IBAction func tapCloseButton(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    
}



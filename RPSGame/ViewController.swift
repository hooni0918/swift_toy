//
//  ViewController.swift
//  RPSGame
//
//  Created by 이지훈 on 2022/09/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var comImage: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var myChoice: Rps = Rps.rock
    
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        comImage.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
         
    }

    @IBAction func rpsBtnTapped(_ sender: UIButton) {
   //가위바위보를 선택해서 그 정보를 저장해야함
//
//        guard let title = sender.currentTitle
//
//        else{
//            return
//        }
//
        
        let title = sender.currentTitle
        print(title)
        
        
        switch title {
        case "가위" :
           myChoice = Rps.scissors
        case "바위" :
            myChoice = Rps.rock
        case "보" :
            myChoice = Rps.paper
        default: //문자열이라서 모든 경우가 들어가는게 아니라서 디포릍 작성
            break
        }
        
        
    }
    
    
    @IBAction func selectBtnTapped(_ sender: UIButton) {
        
        switch comChoice {
        case Rps.rock:
            comImage.image = #imageLiteral(resourceName: "ready")
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comImage.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"

        case Rps.scissors:
            comImage.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
    }
    
    @IBAction func resetBtnTapped(_ sender: UIButton) {
    }
    
    
}


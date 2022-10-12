//
//  OrderViewController.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/10/04.
//

import UIKit



enum SelectedCategory {
    case list
    case map
    case like
}

class OrderViewController: UIViewController {

    @IBOutlet var orderTableView: UITableView!
    @IBOutlet var orderHeaderView: UIView!
    
    @IBOutlet var listButton: UIButton!
    @IBOutlet var mapButton: UIButton!
    @IBOutlet var likeButton: UIButton!

    @IBOutlet var underBarView: UIView!
    @IBOutlet var underBarViewWidth: NSLayoutConstraint!
    
    @IBOutlet var listButtonCenterX: NSLayoutConstraint!
    @IBOutlet var mapButtonCenterX: NSLayoutConstraint!
    @IBOutlet var likeButtonCenterX: NSLayoutConstraint!
     
    
    var selectedCategory = SelectedCategory.list

    override func viewDidLoad() {
        super.viewDidLoad()

        setupOrderHeaderView()
        
        underBarViewWidth.constant = listButton.frame.size.width
        
        listButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    func setupOrderHeaderView() {
        orderHeaderView.backgroundColor = .brown
        orderHeaderView.frame.size.height = 60
        
        let nibName = UINib(nibName: "StoreInfoTableViewCell", bundle: nil)
        orderTableView.register(nibName, forCellReuseIdentifier: "cell2")
        orderTableView.register(nibName, forCellReuseIdentifier: "cell4")
    }
    
    @IBAction func tapCategoryButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        
        switch button.tag {
        case 1:
            selectedCategory = .list
            orderTableView.isScrollEnabled = true
        case 2:
            selectedCategory = .map
            orderTableView.isScrollEnabled = false
        case 3:
            selectedCategory = .like
            orderTableView.isScrollEnabled = true
        default:
            break
        }
        
        listButtonCenterX.priority = button.tag == 1 ? .defaultHigh : .defaultLow
        mapButtonCenterX.priority = button.tag == 2 ? .defaultHigh : .defaultLow
        likeButtonCenterX.priority = button.tag == 3 ? .defaultHigh : .defaultLow
        
        listButton.titleLabel?.font = button.tag == 1 ? .systemFont(ofSize: 20, weight: .bold) : .systemFont(ofSize: 20, weight: .regular)
        mapButton.titleLabel?.font = button.tag == 2 ? .systemFont(ofSize: 20, weight: .bold) : .systemFont(ofSize: 20, weight: .regular)
        likeButton.titleLabel?.font = button.tag == 3 ? .systemFont(ofSize: 20, weight: .bold) : .systemFont(ofSize: 20, weight: .regular)
        
        underBarViewWidth.constant = button.frame.size.width
        
        DispatchQueue.main.async {
            self.orderTableView.reloadData()
        }
    }
}

extension OrderViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        switch selectedCategory {
        case .list:
            return 2
        case .map:
            return 1
        case .like:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch selectedCategory {
        case .list:
            switch section {
            case 0:
                return 1
            case 1:
                return storeDatas.count
            default:
                return 0
            }
        case .map:
            return 1
        case .like:
            return likeStoreDatas.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch selectedCategory {
        case .list:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as? StoreInfoTableViewCell else { return UITableViewCell() }
            
            switch indexPath.section {
            case 0:
                cell.textLabel?.text = "내 주변에 \(storeDatas.count)개의 매장이 있습니다."
                return cell
            case 1:
                cell2.nameLabel.text = storeDatas[indexPath.row].name
                cell2.addressLabel.text = storeDatas[indexPath.row].address
                cell2.distanceLabel.text = "\(storeDatas[indexPath.row].distance)m"
                return cell2
            default:
                return UITableViewCell()
            }
        case .map:
            guard let cell3 = tableView.dequeueReusableCell(withIdentifier: "storeMapCell", for: indexPath) as? StoreMapTableViewCell else { return UITableViewCell() }
            
            return cell3
        case .like:
            guard let cell4 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as? StoreInfoTableViewCell else { return UITableViewCell() }
            cell4.nameLabel.text = likeStoreDatas[indexPath.row].name
            cell4.addressLabel.text = likeStoreDatas[indexPath.row].address
            cell4.distanceLabel.text = "\(likeStoreDatas[indexPath.row].distance)m"
            return cell4
        }
    }
}

extension OrderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "popOrderVC") as? OrderPopupViewController else { return }
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch selectedCategory {
        case .list:
            return UITableView.automaticDimension
        case .map:
            let navigationBarHeight = self.navigationController?.navigationBar.frame.height ?? 0.0
            let tabBarHeight = self.tabBarController?.tabBar.frame.height ?? 0.0
            let statusBar = UIApplication.shared.windows.first(where: {$0.isKeyWindow})?.safeAreaInsets.top ?? 0.0
            return UIScreen.main.bounds.height - navigationBarHeight - tabBarHeight - statusBar - orderHeaderView.frame.height
        case .like:
            return UITableView.automaticDimension
        }
    }
}

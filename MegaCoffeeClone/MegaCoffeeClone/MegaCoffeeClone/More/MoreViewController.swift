//
//  MoreViewController.swift
//  MegaCoffeeClone
//
//  Created by 김성호 on 2022/09/29.
//

//


import Foundation
import UIKit

class MoreViewController: UIViewController {
    // MARK: -- 변수 선언
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var titleView = UIView()
    
    private lazy var leftButton: UIButton = {
        // 단순 UIButton()이 아닌,
        // (type: .system)을 해주지 않으면 버튼 사이즈가 변경되지 않음.
        let left = UIButton(type: .system)
        
        
        left.configuration?.buttonSize = .mini
        left.tintColor = .label
        left.setTitle("계정설정", for: .normal)
        left.translatesAutoresizingMaskIntoConstraints = false
        
        //left.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
        return left
    }()
    
    
    private lazy var centerLabel: UILabel = {
       let center = UILabel()
        
        center.text = "|"
        center.font = UIFont(name: center.font.fontName, size: 15)
        center.textColor = .systemGray
        center.translatesAutoresizingMaskIntoConstraints = false
        
        return center
    }()
    
    
    
    private lazy var rightButton: UIButton = {
        let right = UIButton(type: .system)
        
        right.configuration?.buttonSize = .mini
        right.tintColor = .label
        right.setTitle("고객센터", for: .normal)
        right.translatesAutoresizingMaskIntoConstraints = false
        
        //right.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        
        return right
    }()
    
    
    
    private lazy var stackView = UIStackView()
    private lazy var titleSubView = UIView()
    private lazy var testLabel: UILabel = {
       let label = UILabel()
        
        label.text = "Hello! 님"
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    //private lazy var collectionView = UICollectionView()
    
    
    // MARK: -- View
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    //View가 화면에 보일 시 Navigation Controller를 안 보이게,
    //View가 화면에서 사라질 시점에 Navigation Controller를 보이도록 설정.
    // https://faith-developer.tistory.com/31
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configure()
        
        
        
    }
    
    
    func configure() {
        
        configureScrollView()
        configureContentView()
        //
        configureTitleView()
        configureStackView()
        //
        configureTitleSubView()
        //configureCollectionView()
 
        
    }
    
    
    // MARK: -- 함수 정의
    
    private func configureScrollView() {
        self.view.addSubview(self.scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    private func configureContentView() {
        
        self.scrollView.addSubview(self.contentView)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        ])
    }
    
    private func configureTitleView() {
        self.contentView.addSubview(self.titleView)
        self.titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.titleView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.titleView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.titleView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        self.titleView.backgroundColor = .systemGray5
        
    }
    
    
    
    private func configureStackView() {
        self.titleView.addSubview(self.stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.distribution = .equalSpacing
        self.stackView.spacing = 5
        
        
        self.stackView.addArrangedSubview(leftButton)
        self.stackView.addArrangedSubview(centerLabel)
        self.stackView.addArrangedSubview(rightButton)
        
        NSLayoutConstraint.activate([
            
            self.stackView.leadingAnchor.constraint(equalTo: self.titleView.leadingAnchor, constant: 10),
            self.stackView.bottomAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 5)
            
        ])
    }
    
    
    
    
    private func configureTitleSubView() {
        self.contentView.addSubview(self.titleSubView)
        self.titleSubView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.titleSubView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor),
            self.titleSubView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.titleSubView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.titleSubView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        self.titleSubView.backgroundColor = .lightGray
        
        
        
        self.titleSubView.addSubview(self.testLabel)
        NSLayoutConstraint.activate([
            self.testLabel.leadingAnchor.constraint(equalTo: self.titleSubView.leadingAnchor, constant: 10),
            self.testLabel.bottomAnchor.constraint(equalTo: self.titleSubView.bottomAnchor)
            
        ])
        
        
    }
    
    
    
    
    
    /*
    private func configureCollectionView() {
        self.contentView.addSubview(self.collectionView)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.titleSubView.bottomAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    */
//=================================================
}
//=================================================




/*
 //tableView 경계선 제거 code
 tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
 */

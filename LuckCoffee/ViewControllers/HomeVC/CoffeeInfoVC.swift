//
//  CoffeeInfo.swift
//  LuckCoffee
//
//  Created by Drolllted on 13.05.2024.
//

import UIKit


class CoffeeInfoVC: UIViewController{
    
    private var isSelected: Bool = false
    var coffeeInfo: CoffeeInfo
    
    init() {
        self.coffeeInfo = CoffeeInfo()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = coffeeInfo
    }
    
    lazy var buttonBarItem: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        
        button.tintColor = .gray
        
        return button
    }()
    
    lazy var backButton: UIButton = {
        let image = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        image.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        image.tintColor = .black
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Detail"
        
        buttonBarItem.addTarget(self, action: #selector(didTapHeart), for: .touchUpInside)
        let buttonBar = UIBarButtonItem(customView: buttonBarItem)
        
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        let backButtonLeft = UIBarButtonItem(customView: backButton)
        
        self.navigationItem.rightBarButtonItem = buttonBar
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont(name: "Sora-Bold", size: 18)!]
        self.navigationItem.leftBarButtonItem = backButtonLeft
    }
    
    //MARK: - Obj-c Method
    
    @objc func didTapHeart() {
        let color = isSelected ? UIColor.brown : UIColor.gray
        isSelected.toggle()
        buttonBarItem.tintColor = color
    }
    
    @objc func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

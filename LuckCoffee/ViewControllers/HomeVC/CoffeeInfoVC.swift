//
//  CoffeeInfo.swift
//  LuckCoffee
//
//  Created by Drolllted on 13.05.2024.
//

import UIKit


class CoffeeInfoVC: UIViewController{
    
    private var isSelected: Bool = false
    var coffeeInfo: CoffeeInfo!
    
    override func loadView() {
        coffeeInfo = CoffeeInfo()
        view = coffeeInfo
    }
    
    lazy var buttonBarItem: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        
        button.tintColor = .gray
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Detail"
        
        buttonBarItem.addTarget(self, action: #selector(didTapHeart), for: .touchUpInside)
        let buttonBar = UIBarButtonItem(customView: buttonBarItem)
        
        self.navigationItem.rightBarButtonItem = buttonBar
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .bold)]
    }
    
    //MARK: - Obj-c Method
    
    @objc func didTapHeart() {
        let color = isSelected ? UIColor.brown : UIColor.gray
        isSelected.toggle()
        buttonBarItem.tintColor = color
    }
    
}

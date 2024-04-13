//
//  TabBar.swift
//  LuckCoffee
//
//  Created by Drolllted on 13.04.2024.
//

import UIKit

class TabBar: UIView {
    
    static let shared = TabBar()
    
    lazy var rectangleTabBar: UIView = {
        let rectangle = UIView()
        rectangle.backgroundColor = .white
        rectangle.layer.cornerRadius = 15
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        rectangle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return rectangle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setRectangle()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createTabBar(viewController: UIViewController, image: UIImage?) -> UIViewController{
        viewController.tabBarItem.image = image
        
        return viewController
    }
    
    private func setRectangle() {
        addSubview(rectangleTabBar)
        
        NSLayoutConstraint.activate([
            rectangleTabBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            rectangleTabBar.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
}

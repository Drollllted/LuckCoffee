//
//  TabBar.swift
//  LuckCoffee
//
//  Created by Drolllted on 13.04.2024.
//

import UIKit

final class TabBar: UIView {
    
    static let shared = TabBar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createTabBar(viewController: UIViewController, image: UIImage?) -> UIViewController{
        viewController.tabBarItem.image = image
        
        return viewController
    }

    
}


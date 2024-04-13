//
//  TabBarController.swift
//  LuckCoffee
//
//  Created by Drolllted on 13.04.2024.
//

import UIKit

final class TabBarController: UITabBarController{
    
    private var build = TabBar.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBar()
    }
    
   private func createTabBar() {
       
       //tabBar.backgroundColor = .white
       tabBar.addSubview(build.rectangleTabBar)
       
       viewControllers = [
        build.createTabBar(viewController: HomeViewController(), image: UIImage(systemName: "house.fill")),
        build.createTabBar(viewController: LoveViewController(), image: UIImage(systemName: "heart.fill")),
        build.createTabBar(viewController: BuyViewController(), image: UIImage(systemName: "bag.fill"))
       ]
       
    }
    
}

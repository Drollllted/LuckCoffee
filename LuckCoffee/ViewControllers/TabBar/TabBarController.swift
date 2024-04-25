//
//  TabBarController.swift
//  LuckCoffee
//
//  Created by Drolllted on 13.04.2024.
//

import UIKit

final class TabBarController: UITabBarController{
    
    private var build = TabBar.shared
    private var isSelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabBar()
    }
    
   private func createTabBar() {
    
       tabBar.backgroundColor = .systemBackground
       
       tabBar.layer.cornerRadius = 10
       tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
       tabBar.layer.masksToBounds = true
       
       tabBar.tintColor = .systemOrange
       
       let homeVC = HomeViewController()
       homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house.fill"), tag: 0)
       let loveVC = LoveViewController()
       loveVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart.fill"), tag: 1)
       let buyVC = BuyViewController()
       buyVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "bag.fill"), tag: 2)
       
       let nav1 = UINavigationController(rootViewController: homeVC)
       let nav2 = UINavigationController(rootViewController: loveVC)
       let nav3 = UINavigationController(rootViewController: buyVC)
       
       setViewControllers([nav1, nav2, nav3], animated: true)
    }
    

    
}

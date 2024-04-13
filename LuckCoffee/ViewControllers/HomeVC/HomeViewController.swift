//
//  ViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 13.04.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var homeView: HomeView!
    
    override func loadView() {
        homeView = HomeView()
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        
    }


}


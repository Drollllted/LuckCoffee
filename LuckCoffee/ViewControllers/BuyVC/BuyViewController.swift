//
//  BuyViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.04.2024.
//

import UIKit

class BuyViewController: UIViewController {
    
    private var buyView: BuyView!
    
    override func loadView() {
        
        buyView = BuyView()
        view = buyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
}

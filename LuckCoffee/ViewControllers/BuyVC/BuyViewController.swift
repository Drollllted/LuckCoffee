//
//  BuyViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.04.2024.
//

import UIKit

final class BuyViewController: UIViewController {
    
    private var buyView: BuyView!
    
    override func loadView() {
        
        buyView = BuyView()
        view = buyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Order"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .bold)]
    }
}

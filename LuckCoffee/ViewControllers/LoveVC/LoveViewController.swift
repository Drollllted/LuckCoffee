//
//  LoveViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.04.2024.
//

import UIKit

class LoveViewController: UIViewController {
    
    private var loveView: LoveView!
    
    override func loadView() {
        loveView = LoveView()
        view = loveView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
    
    
}

//
//  BuyViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.04.2024.
//

import UIKit

protocol BuyViewControllerDelegate: AnyObject {
    func addInOrderCoffee(coffee: CoffeeModel)
}

final class BuyViewController: UIViewController {
    
    private var buyView: BuyView!
    private var orderCoffee = [CoffeeModel]()
    
    override func loadView() {
        buyView = BuyView()
        view = buyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavBar()
        delegateBuyCollectionView()
    }
    
    private func setupNavBar() {
        self.navigationItem.title = "Order"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor.black]
    }
    
    private func delegateBuyCollectionView() {
        buyView.orderCollectionView.delegate = self
        buyView.orderCollectionView.dataSource = self
    }
}

extension BuyViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BuyCell.id, for: indexPath) as? BuyCell else {fatalError("Hi-hi")}
        
        return cell
    }
    
    
}

extension BuyViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 10, height: 80)
    }
}


//MARK: Protocol function

extension BuyViewController: BuyViewControllerDelegate {
    
    func addInOrderCoffee(coffee: CoffeeModel) {
        orderCoffee.append(coffee)
        self.buyView.orderCollectionView.reloadData()
    }
    
}

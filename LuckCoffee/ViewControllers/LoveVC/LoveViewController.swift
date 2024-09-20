//
//  LoveViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.04.2024.
//

import UIKit

final class LoveViewController: UIViewController {
    
    //MARK: - Properties
    
    private var loveView: LoveView!
    var favoritesCoffee = CoreDataManager.shared.coffee
    private var coreDataManaged = CoreDataManager.shared
    
    //MARK: - LifeCycles
    
    override func loadView() {
        loveView = LoveView()
        view = loveView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupCollectionView()
        NotificationCenter.default.addObserver(self, selector: #selector(getUpdates), name: .getUpdates, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLoveCollection()
        loveView.loveCollectionView.reloadData()
    }
    
    //MARK: - Func in ViewDidLoad not @objc
    
    private func setupNavBar() {
        navigationItem.title = "Love"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.customFont(type: .SoraBold, size: 18)!, NSAttributedString.Key.foregroundColor : UIColor.black]
    }
    
    private func setupCollectionView(){
        loveView.loveCollectionView.dataSource = self
        loveView.loveCollectionView.delegate = self
    }
    
    private func updateLoveCollection() {
        do{
            print("123")
            favoritesCoffee = coreDataManaged.fetchFavoritexCoffee()
            loveView.loveCollectionView.reloadData()
        }
    }
    
    //MARK: - @Objc function in ViewDidLoad
    
    @objc func getUpdates() {
        updateLoveCollection()
    }
    
    
}

//MARK: - Extensions in LoveCollectionView

extension LoveViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoritesCoffee.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoffeeCell.identifire, for: indexPath) as? CoffeeCell else {fatalError("Troubles troubles")}
        
        let coffee = favoritesCoffee[indexPath.item]
        
        cell.nameCoffeeLabel.text = coffee.nameCoffee
        cell.ingredientsCoffeeLabel.text = coffee.coffeeIngredients
        cell.imageCoffeeCell.image = UIImage(named: coffee.imageCoffee ?? "")
        
        cell.priceCoffeeLabel.text = String(coffee.coffeePrice) + "$"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delete(at: indexPath)
    }
    
    //MARK: - function in collectionView button
    
    func delete(at indexPath: IndexPath) {
        guard let coffeeName = favoritesCoffee[indexPath.item].nameCoffee else {return}
        
        do {
            coreDataManaged.deleteCoffees(coffeeName: coffeeName)
            favoritesCoffee.remove(at: indexPath.item)
            loveView.loveCollectionView.performBatchUpdates({
                loveView.loveCollectionView.deleteItems(at: [indexPath])
            }, completion: nil)
        }
    }
    
}
extension LoveViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 7, left: 20, bottom: 7, right: 20)
    }
}

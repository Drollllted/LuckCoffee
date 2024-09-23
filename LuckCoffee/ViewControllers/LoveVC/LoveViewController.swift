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
        alert(at: indexPath)
    }
    
    //MARK: - function in collectionView button
    
    private func alert(at indexPath: IndexPath) {
        guard let coffeeName = favoritesCoffee[indexPath.item].nameCoffee else {return}
        let alertController = UIAlertController(title: "Action", message: "What do you want to do?", preferredStyle: .actionSheet)
        let deleteItem = UIAlertAction(title: "Delete", style: .destructive) { _ in
            do {
                self.coreDataManaged.deleteCoffees(coffeeName: coffeeName)
                self.favoritesCoffee.remove(at: indexPath.item)
                self.loveView.loveCollectionView.performBatchUpdates({
                    self.loveView.loveCollectionView.deleteItems(at: [indexPath])
                }, completion: nil)
            }
        }
        
        let infoItem = UIAlertAction(title: "Infomation", style: .default) { _ in
            let vc = CoffeeInfoVC()
            let coffeeModel = self.favoritesCoffee[indexPath.item]
            vc.coffeeInfo.imageCoffeeInfo.image = UIImage(named: coffeeModel.imageCoffee ?? "CoffeeImage")
            vc.coffeeInfo.namedCoffeeInfo.text = coffeeModel.nameCoffee
            vc.coffeeInfo.ingredientsCoffee.text = coffeeModel.coffeeIngredients
            vc.coffeeInfo.ratingLabel.text = String(coffeeModel.ratingCoffee)
            vc.coffeeInfo.discriptionLabel.text = coffeeModel.coffeeDiscription
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        let cancelItem = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(infoItem)
        alertController.addAction(deleteItem)
        alertController.addAction(cancelItem)
        
        self.present(alertController, animated: true)
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

//
//  LoveViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.04.2024.
//

import UIKit

class LoveViewController: UIViewController {
    
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoveCell.id, for: indexPath) as? LoveCell else {fatalError("Troubles troubles")}
        
        let coffee = favoritesCoffee[indexPath.item]
        cell.nameCoffee.text = coffee.nameCoffee
        cell.coffeeIngredient.text = coffee.coffeeIngredients
        cell.imageCoffee.image = UIImage(named: coffee.imageCoffee ?? "")
        cell.heartButton.addTarget(self, action: #selector(deleteRow), for: .touchUpInside)
        
        return cell
    }
    
    //MARK: - objc function in collectionView button
    
    @objc private func deleteRow(_ sender: UIButton) {
             let indexPath = IndexPath(item: sender.tag, section: 0)
             guard let coffeeName = favoritesCoffee[indexPath.item].nameCoffee else { return }
        
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
        return CGSize(width: UIScreen.main.bounds.width, height: 150)
    }
}

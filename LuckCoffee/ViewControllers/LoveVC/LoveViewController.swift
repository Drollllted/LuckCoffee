//
//  LoveViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.04.2024.
//

import UIKit

class LoveViewController: UIViewController {
    
    private var loveView: LoveView!
    var favoritesCoffee = CoreDataManager.coffee
    private var coreDataManaged = CoreDataManager.shared
    
    override func loadView() {
        loveView = LoveView()
        view = loveView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupCollectionView()
        print(favoritesCoffee.count)
        NotificationCenter.default.addObserver(self, selector: #selector(getUpdates), name: .getUpdates, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLoveCollection()
    }
    
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
            favoritesCoffee = try coreDataManaged.fetchFavoritexCoffee()
            loveView.loveCollectionView.reloadData()
        }catch{
            print("error in LoveViewController: \(error.localizedDescription)")
        }
    }
    
    @objc func getUpdates() {
        updateLoveCollection()
    }
    
    
}

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
        
        return cell
    }
    
}
extension LoveViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 150)
    }
}

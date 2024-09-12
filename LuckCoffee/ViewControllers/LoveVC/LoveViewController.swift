//
//  LoveViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.04.2024.
//

import UIKit

class LoveViewController: UIViewController {
    
    private var loveView: LoveView!
    private var favoritesCoffee = [Coffee]()
    private var coreDataManaged = CoreDataManager.shared
    
    override func loadView() {
        loveView = LoveView()
        view = loveView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupNavBar() {
        navigationItem.title = "Love"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.customFont(type: .SoraBold, size: 18)!, NSAttributedString.Key.foregroundColor : UIColor.black]
    }
    
    private func setupCollectionView(){
        loveView.loveCollectionView.dataSource = self
        loveView.loveCollectionView.delegate = self
    }
    
    
}

extension LoveViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoritesCoffee.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoveCell.id, for: indexPath) as? LoveCell else {fatalError("Troubles troubles")}
        
        return cell
    }
    
}
extension LoveViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 150)
    }
}

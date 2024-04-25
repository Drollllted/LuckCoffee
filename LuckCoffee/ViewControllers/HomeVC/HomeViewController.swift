//
//  ViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 13.04.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    
    private var homeView: HomeView!
    
    private let categoriesCoffee: [String] = ["Cappuchino", "Latte", "Mocachino", "Americano", "Other"]
 
    
    //MARK: - LifeCycles
    
    override func loadView() {
        homeView = HomeView()
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        homeView.horizontalSlideMenu.delegate = self
        homeView.horizontalSlideMenu.dataSource = self
        
    }


}

//MARK: - Horizontal Slide Menu

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return categoriesCoffee.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideMenuCell.identifire, for: indexPath) as? SlideMenuCell else {fatalError("Hi=hi")}
        cell.categotyLabel.text = categoriesCoffee[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let fontName = UIFont(name: "Arial Bold", size: 18)
        let categoriesAttributes = [NSAttributedString.Key.font: fontName as Any]
        let widthCategories = categoriesCoffee[indexPath.item].size(withAttributes: categoriesAttributes).width + 30
        
        
        return CGSize(width: widthCategories, height: homeView.horizontalSlideMenu.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

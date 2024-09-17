//
//  SearchViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 16.09.2024.
//

import UIKit

final class SearchViewController: UIViewController{
    
    //MARK: - Properties
    
    var searchView: SearchView!
    var filteredCoffee = [CoffeeModel]()
    
    //MARK: - LyfeCycles
    
    override func loadView() {
        searchView = SearchView()
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        collectionViewDelegate()
        
        filteredCoffee = data
    }
    
    //MARK: - Function not @objc
    
    private func setupNavBar() {
        self.navigationItem.title = "Search"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont(name: "Sora-Bold", size: 18)!]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withTintColor(.gray, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(backButtonAction))
    }
    
    private func collectionViewDelegate() {
        searchView.filteredCollectionView.delegate = self
        searchView.filteredCollectionView.dataSource = self
        
        searchView.searchTextField.delegate = self
    }
    
    //MARK: - @objc functions
    
    @objc private func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
}



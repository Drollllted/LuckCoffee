//
//  SearchViewController.swift
//  LuckCoffee
//
//  Created by Drolllted on 16.09.2024.
//

import UIKit

final class SearchViewController: UIViewController{
    //MARK: - Properties
    private var searchView: SearchView!
    
    //MARK: - LyfeCycles
    
    override func loadView() {
        searchView = SearchView()
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        collectionViewDelegate()
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
    }
    
    //MARK: - @objc functions
    
    @objc private func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
}



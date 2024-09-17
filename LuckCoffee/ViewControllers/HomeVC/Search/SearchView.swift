//
//  SearchView.swift
//  LuckCoffee
//
//  Created by Drolllted on 16.09.2024.
//

import UIKit

final class SearchView: UIView {
    
    //MARK: - Create UI Models
    
    lazy var backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor(resource: .backgroundRectangle).cgColor
        view.layer.borderWidth = 2
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var searchTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .line
        tf.placeholder = "Search Coffee..."
        tf.textColor = .black
        tf.backgroundColor = .clear
        tf.keyboardType = .default
        tf.layer.cornerRadius = 15
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    lazy var filteredCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CoffeeCell.self, forCellWithReuseIdentifier: CoffeeCell.identifire)
        cv.showsVerticalScrollIndicator = false
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    //MARK: - Init(frame:)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupVC()
        constraintsUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup and Constraints UI
    
}
extension SearchView{
    func setupVC(){
        backgroundColor = .systemBackground
    }
    
    func setupUI(){
        addSubview(backView)
        backView.addSubview(searchTextField)
        addSubview(filteredCollectionView)
    }
    
    func constraintsUI(){
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            backView.heightAnchor.constraint(equalToConstant: 50),
            
            searchTextField.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            searchTextField.topAnchor.constraint(equalTo: backView.topAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            
            filteredCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            filteredCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            filteredCollectionView.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: 15),
            filteredCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

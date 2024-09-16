//
//  LoveView.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.04.2024.
//

import UIKit

final class LoveView: UIView {
    
    lazy var loveCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(LoveCell.self
                    , forCellWithReuseIdentifier: LoveCell.id)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
        
        setupUI()
        
        constraintsUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension LoveView {
    func createView() {
        backgroundColor = .systemBackground
    }
    
    func setupUI() {
        addSubview(loveCollectionView)
    }
    
    func constraintsUI() {
        NSLayoutConstraint.activate([
            loveCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            loveCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            loveCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            loveCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

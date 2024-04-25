//
//  SlideMenuCell.swift
//  LuckCoffee
//
//  Created by Drolllted on 17.04.2024.
//

import UIKit

class SlideMenuCell: UICollectionViewCell {
    
    static let identifire = "identifire"
    
    lazy var categotyLabel: UILabel = {
        let label = UILabel()
        label.text = "Hi"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override var isSelected: Bool {
        didSet{
            backgroundColor = isSelected ? .brown : .systemGray6
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setCategoryLabel()
        
        backgroundColor = .systemGray6
        layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCategoryLabel() {
        addSubview(categotyLabel)
        
        NSLayoutConstraint.activate([
            categotyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            categotyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}

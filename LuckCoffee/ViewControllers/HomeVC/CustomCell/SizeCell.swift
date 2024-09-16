//
//  SizeCell.swift
//  LuckCoffee
//
//  Created by Drolllted on 06.08.2024.
//

import UIKit

final class SizeCell: UICollectionViewCell {
    
    static let identifire = "id"
    
    override var isSelected: Bool {
        didSet{
            if isSelected{
                layer.borderColor = UIColor.brown.cgColor
                sizeLabel.textColor = .brown
            }
        }
    }
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .SoraBold, size: 16)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        
        setupUI()
        
        constraintsUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension SizeCell {
    func setupUI(){
        addSubview(backView)
        backView.addSubview(sizeLabel)
    }
    
    func constraintsUI(){
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backView.topAnchor.constraint(equalTo: self.topAnchor),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            sizeLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            sizeLabel.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
        ]
        )
    }
    
}

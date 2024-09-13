//
//  LoveCell.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.08.2024.
//

import UIKit

class LoveCell: UICollectionViewCell {
    
    static let id = "Identifire"
    
    lazy var imageCoffee: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(resource: .capuchino3)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var nameCoffee: UILabel = {
        let label = UILabel()
        label.text = "NameCoffee"
        label.font = .customFont(type: .SoraBold, size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var coffeeIngredient: UILabel = {
        let label = UILabel()
        label.text = "IngredientsCoffee"
        label.font = .customFont(type: .SoraMedium, size: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackNameCoffee: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.spacing = 20
        stack.axis = .vertical
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(nameCoffee)
        stack.addArrangedSubview(coffeeIngredient)
        
        return stack
    }()
    
    lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .systemBrown
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        mainSetup()
        
        setupUI()
        
        constraintsUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension LoveCell {
    func mainSetup() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemBrown.cgColor
    }
    
    func setupUI(){
        addSubview(imageCoffee)
        addSubview(stackNameCoffee)
        addSubview(heartButton)
    }
    
    func constraintsUI(){
        NSLayoutConstraint.activate([
            imageCoffee.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageCoffee.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            imageCoffee.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            imageCoffee.widthAnchor.constraint(equalToConstant: 100),
            
            stackNameCoffee.leadingAnchor.constraint(equalTo: imageCoffee.trailingAnchor, constant: 10),
            stackNameCoffee.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            
            heartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            heartButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            heartButton.heightAnchor.constraint(equalToConstant: 50),
            heartButton.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}

//
//  CoffeeCell.swift
//  LuckCoffee
//
//  Created by Drolllted on 29.04.2024.
//

import UIKit

final class CoffeeCell: UICollectionViewCell{
    
    //MARK: - Properties
    
    static let identifire = "identifire"
    var coffeeModel: CoffeeModel!
    
    //MARK: - UIModels
    
    lazy var imageCoffeeCell: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 5
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var nameCoffeeLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .SoraSemiBold, size: 18)
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ingredientsCoffeeLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .SoraRegular, size: 12)
        label.textColor = .gray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var priceCoffeeLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .SoraSemiBold, size: 18)
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        button.backgroundColor = .brown
        button.layer.cornerRadius = 10
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        
        return button
    }()
    
    //MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray6
        layer.cornerRadius = 20
        
        setImageCoffee()
        
        setNameCoffee()
        
        setIngredientsCoffee()
        
        setPriceCoffee()
        
        setPlusButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    
    private func setImageCoffee() {
        addSubview(imageCoffeeCell)
        
        NSLayoutConstraint.activate([
            imageCoffeeCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageCoffeeCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            imageCoffeeCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            imageCoffeeCell.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    private func setNameCoffee() {
        addSubview(nameCoffeeLabel)
        
        NSLayoutConstraint.activate([
            nameCoffeeLabel.topAnchor.constraint(equalTo: imageCoffeeCell.bottomAnchor, constant: 10),
            nameCoffeeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            nameCoffeeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func setIngredientsCoffee() {
        addSubview(ingredientsCoffeeLabel)
        
        NSLayoutConstraint.activate([
            ingredientsCoffeeLabel.topAnchor.constraint(equalTo: nameCoffeeLabel.bottomAnchor, constant: 5),
            ingredientsCoffeeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            ingredientsCoffeeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func setPriceCoffee() {
        addSubview(priceCoffeeLabel)
        
        NSLayoutConstraint.activate([
            priceCoffeeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            priceCoffeeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
        ])
    }
    
    private func setPlusButton() {
        addSubview(plusButton)
        
        NSLayoutConstraint.activate([
            plusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            plusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}

//
//  CoffeeInfo.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.05.2024.
//

import UIKit

class CoffeeInfo: UIView {
    
    private var dataCell: CoffeeModel!
    private var isSelected: Bool = false
    
    lazy var imageCoffeeInfo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 230).isActive = true
        
        return image
        
    }()
    
    lazy var namedCoffeeInfo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.tintColor = .black
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var ingredientsCoffee: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.tintColor = .gray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var ratingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.titleLabel?.textColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.imageView?.tintColor = isSelected ? UIColor.green : UIColor.gray
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setImageCoffee()
        
        setLabelCoffee()
        
        setIngredientsLabel()
        
        setRatingButton()
    }
    
    private func setImageCoffee() {
        addSubview(imageCoffeeInfo)
        
        NSLayoutConstraint.activate([
            imageCoffeeInfo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            imageCoffeeInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            imageCoffeeInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25)
        ])
    }
    
    private func setLabelCoffee() {
        addSubview(namedCoffeeInfo)
        
        NSLayoutConstraint.activate([
            namedCoffeeInfo.topAnchor.constraint(equalTo: imageCoffeeInfo.bottomAnchor, constant: 15),
            namedCoffeeInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            namedCoffeeInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25)
        ])
    }
    
    private func setIngredientsLabel() {
        addSubview(ingredientsCoffee)
        
        NSLayoutConstraint.activate([
            ingredientsCoffee.topAnchor.constraint(equalTo: namedCoffeeInfo.bottomAnchor, constant: 10),
            ingredientsCoffee.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25)
        ])
    }
    
    private func setRatingButton() {
        addSubview(ratingButton)
        
        NSLayoutConstraint.activate([
            ratingButton.topAnchor.constraint(equalTo: ingredientsCoffee.bottomAnchor, constant: 15),
            ratingButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25)
        ])
    }
    
    
}

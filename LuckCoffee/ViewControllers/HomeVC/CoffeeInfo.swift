//
//  CoffeeInfo.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.05.2024.
//

import UIKit

class CoffeeInfo: UIView {
    
    var coffeeModel: CoffeeModel!
    private let anchor: CGFloat = 20
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
        label.font = UIFont.customFont(type: .SoraMedium, size: 18)
        label.tintColor = .black
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var ingredientsCoffee: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .SoraRegular, size: 12)
        label.tintColor = .gray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var ratingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.titleLabel?.textColor = .black
        button.titleLabel?.font = .customFont(type: .SoraMedium, size: 12)
        button.imageView?.tintColor = isSelected ? UIColor.green : UIColor.gray
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return button
    }()
    
    private let rectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 10
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        return view
    }()
    
    private let discriptionName: UILabel = {
        let label = UILabel()
        label.text = "Discription"
        label.font = .customFont(type: .SoraSemiBold, size: 16)
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var discriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(type: .SoraMedium, size: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
    
        return label
    }()
    
    lazy var sizeLabel: UILabel = {
       let label = UILabel()
        label.text = "Size"
        label.font = .customFont(type: .SoraSemiBold, size: 16)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setImageCoffee()
        
        setLabelCoffee()
        
        setIngredientsLabel()
        
        setRatingButton()
        
        setRectangleView()
        
        setDiscriptionNameLabel()
        
        setDiscriptionLabel()
        
        setSizeLabel()
    }
    
    private func setImageCoffee() {
        addSubview(imageCoffeeInfo)
        
        NSLayoutConstraint.activate([
            imageCoffeeInfo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            imageCoffeeInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor),
            imageCoffeeInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setLabelCoffee() {
        addSubview(namedCoffeeInfo)
        
        NSLayoutConstraint.activate([
            namedCoffeeInfo.topAnchor.constraint(equalTo: imageCoffeeInfo.bottomAnchor, constant: 15),
            namedCoffeeInfo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor),
            namedCoffeeInfo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setIngredientsLabel() {
        addSubview(ingredientsCoffee)
        
        NSLayoutConstraint.activate([
            ingredientsCoffee.topAnchor.constraint(equalTo: namedCoffeeInfo.bottomAnchor, constant: 10),
            ingredientsCoffee.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor)
        ])
    }
    
    private func setRatingButton() {
        addSubview(ratingButton)
        
        NSLayoutConstraint.activate([
            ratingButton.topAnchor.constraint(equalTo: ingredientsCoffee.bottomAnchor, constant: 15),
            ratingButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor)
        ])
    }
    
    private func setRectangleView() {
        addSubview(rectangleView)
        
        NSLayoutConstraint.activate([
            rectangleView.topAnchor.constraint(equalTo: ratingButton.bottomAnchor, constant: 15),
            rectangleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor),
            rectangleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setDiscriptionNameLabel() {
        addSubview(discriptionName)
        
        NSLayoutConstraint.activate([
            discriptionName.topAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: 15),
            discriptionName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor)
        ])
    }
    
    private func setDiscriptionLabel() {
        addSubview(discriptionLabel)
        
        NSLayoutConstraint.activate([
            discriptionLabel.topAnchor.constraint(equalTo: discriptionName.bottomAnchor, constant: 15),
            discriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor),
            discriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -anchor)
            
        ])
    }
    
    private func setSizeLabel() {
        addSubview(sizeLabel)
        
        NSLayoutConstraint.activate([
            sizeLabel.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 15),
            sizeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: anchor),
            sizeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -anchor)
        ])
    }
    
}

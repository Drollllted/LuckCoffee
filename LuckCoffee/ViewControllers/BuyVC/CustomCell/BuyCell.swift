//
//  LoveCell.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.08.2024.
//

import UIKit

final class BuyCell: UICollectionViewCell {
    
    static let id = "Identifire"
    var countCoffee = 1
    
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
        stack.spacing = 10
        stack.axis = .vertical
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(nameCoffee)
        stack.addArrangedSubview(coffeeIngredient)
        
        return stack
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .customFont(type: .SoraBold, size: 18)
        
        button.addTarget(self, action: #selector(minusAction), for: .touchUpInside)
        
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor(resource: .colors).cgColor
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return button
    }()
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .customFont(type: .SoraBold, size: 14)
        label.text = "\(countCoffee)"
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        return label
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .customFont(type: .SoraBold, size: 18)
        
        button.addTarget(self, action: #selector(plusAction), for: .touchUpInside)
        
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor(resource: .colors).cgColor
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return button
    }()
    
    lazy var stackStepper: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(minusButton)
        stack.addArrangedSubview(countLabel)
        stack.addArrangedSubview(plusButton)
        return stack
    }()
    
    //MARK: - objc functions
    
    @objc private func minusAction() {
        if countCoffee > 1{
            countCoffee -= 1
        }
        getCountCoffee()
    }
    
    @objc private func plusAction() {
        countCoffee += 1
        getCountCoffee()
    }
    
    private func getCountCoffee() {
        countLabel.text = "\(countCoffee)"
    }
    
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
extension BuyCell {
    func mainSetup() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemBrown.cgColor
    }
    
    func setupUI(){
        addSubview(imageCoffee)
        addSubview(stackNameCoffee)
        addSubview(stackStepper)
    }
    
    func constraintsUI(){
        NSLayoutConstraint.activate([
            imageCoffee.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageCoffee.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageCoffee.topAnchor.constraint(equalTo: self.topAnchor),
            imageCoffee.widthAnchor.constraint(equalToConstant: 80),
            
            stackNameCoffee.leadingAnchor.constraint(equalTo: imageCoffee.trailingAnchor, constant: 10),
            stackNameCoffee.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            stackNameCoffee.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            stackStepper.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackStepper.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}

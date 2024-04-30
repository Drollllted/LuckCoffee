//
//  CoffeeCell.swift
//  LuckCoffee
//
//  Created by Drolllted on 29.04.2024.
//

import UIKit

class CoffeeCell: UICollectionViewCell{
    //MARK: - Properties
    static let identifire = "identifire"
    var coffeeModel: CoffeeModel!
    
    //MARK: - UIModels
    
    lazy var imageCoffeeCell: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //MARK: - LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray6
        layer.cornerRadius = 10
        
        setImageCoffee()
    }
    
    override func prepareForReuse() {
        imageCoffeeCell.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    
    private func setImageCoffee() {
        addSubview(imageCoffeeCell)
        
        NSLayoutConstraint.activate([
            imageCoffeeCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            imageCoffeeCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            imageCoffeeCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25)
        
        ])
    }
    
    func setupImage() {
        imageCoffeeCell.image = UIImage(named: coffeeModel.imageCoffee )
    }
}

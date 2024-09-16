//
//  BuyController.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.04.2024.
//

import UIKit

final class BuyView: UIView{
    
    lazy var shopLabel: UILabel = {
        let label = UILabel()
        label.text = "Coffee shop Address"
        label.font = .customFont(type: .SoraBold, size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Saint-P"
        label.font = .customFont(type: .SoraMedium, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var streetLabel: UILabel = {
        let label = UILabel()
        label.text = "Bolshaya Konyushennaya street, 31"
        label.textAlignment = .left
        label.font = .customFont(type: .SoraLight, size: 16)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Stack Buttons
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        constraintsUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension BuyView{
    func setupUI(){
        addSubview(shopLabel)
        addSubview(cityLabel)
        addSubview(streetLabel)
    }
    
    func constraintsUI(){
        NSLayoutConstraint.activate([
            shopLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            shopLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            
            cityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            cityLabel.topAnchor.constraint(equalTo: shopLabel.bottomAnchor, constant: 15),
            
            streetLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            streetLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10),
            
            
        ])
    }
}

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
    
    lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .leading
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    func stackAdressButton(titleText: String, image: String) -> UIStackView {
        
        lazy var viewButton: UIView = {
            $0.layer.cornerRadius = 15
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            return $0
            
        }(UIButton())
        
        lazy var iconImage: UIImageView = {
            $0.image = UIImage(systemName: image)
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .black
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            return $0
        }(UIImageView())
        
        lazy var nameLabel: UILabel = {
            $0.text = titleText
            $0.font = .customFont(type: .SoraLight, size: 14)
            $0.textAlignment = .center
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            return $0
        }(UILabel())
        
        lazy var stackNameAndIcon: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = 5
            stack.alignment = .center
            
            stack.translatesAutoresizingMaskIntoConstraints = false
            
            stack.addArrangedSubview(iconImage)
            stack.addArrangedSubview(nameLabel)
            
            return stack
        }()
        
        lazy var clearButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .clear
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }()
        
        stackNameAndIcon.addSubview(viewButton)
        stackNameAndIcon.addSubview(clearButton)
        
        NSLayoutConstraint.activate([
            viewButton.heightAnchor.constraint(equalToConstant: 20),
            viewButton.widthAnchor.constraint(equalToConstant: 100),
            
            stackNameAndIcon.centerYAnchor.constraint(equalTo: viewButton.centerYAnchor),
            
            clearButton.leadingAnchor.constraint(equalTo: stackNameAndIcon.leadingAnchor),
            clearButton.trailingAnchor.constraint(equalTo: stackNameAndIcon.trailingAnchor),
            clearButton.bottomAnchor.constraint(equalTo: stackNameAndIcon.bottomAnchor),
            clearButton.topAnchor.constraint(equalTo: stackNameAndIcon.topAnchor),
        ])
        
        return stackNameAndIcon
        
    }
    
    
    func createButtons() {
        let button1 = stackAdressButton(titleText: "Edit Adress", image: "pencil.and.list.clipboard")
        let button2 = stackAdressButton(titleText: "add Note", image: "note.text")
        
        buttonStack.addArrangedSubview(button1)
        buttonStack.addArrangedSubview(button2)
    }
    
    
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
        addSubview(buttonStack)
        
        createButtons()
    }
    
    func constraintsUI(){
        NSLayoutConstraint.activate([
            shopLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            shopLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            
            cityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            cityLabel.topAnchor.constraint(equalTo: shopLabel.bottomAnchor, constant: 15),
            
            streetLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            streetLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10),
            
            buttonStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            buttonStack.topAnchor.constraint(equalTo: streetLabel.bottomAnchor, constant: 10),
        ])
    }
}

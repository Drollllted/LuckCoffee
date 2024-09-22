//
//  BuyController.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.04.2024.
//

import UIKit

final class BuyView: UIView{
    
    //MARK: - Create UI-Models
    
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
        stack.spacing = 30
        stack.alignment = .leading
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    func stackAdressButton(titleText: String, image: String) -> UIStackView {
        
        lazy var viewButton: UIView = {
            $0.layer.cornerRadius = 15
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1
            $0.titleLabel?.textAlignment = .center
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
        
//        let fontName = UIFont.customFont(type: .SoraSemiBold, size: 16)
//        let categoriesAttributes = [NSAttributedString.Key.font: fontName as Any]
        
        lazy var clearButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .clear
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }()
        
        stackNameAndIcon.addSubview(viewButton)
        stackNameAndIcon.addSubview(clearButton)
        
        NSLayoutConstraint.activate([
            viewButton.heightAnchor.constraint(equalToConstant: 30),
            viewButton.widthAnchor.constraint(equalToConstant: 120),
            
            stackNameAndIcon.centerYAnchor.constraint(equalTo: viewButton.centerYAnchor),
            stackNameAndIcon.centerXAnchor.constraint(equalTo: viewButton.centerXAnchor),
            
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
    
    private let rectangleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 10
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        return view
    }()
    
    private let yourOrderLabel: UILabel = {
        let label = UILabel()
        label.text = "Your's Order:"
        label.font = .customFont(type: .SoraBold, size: 20)
        label.textColor = .black
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Order Collection View
    
    var orderCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(BuyCell.self, forCellWithReuseIdentifier: BuyCell.id)
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var deviderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 15
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: - Discount Button
    
    lazy var discountView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray5.cgColor
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var saleIcon: UIImageView = {
        let image = UIImageView()
        image.image = .sale
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 20).isActive = true
        image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        return image
    }()
    
    lazy var discountLabel: UILabel = {
        let label = UILabel()
        label.text = "1 Discount is Applies"
        label.font = .customFont(type: .SoraSemiBold, size: 14)
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var stackSale: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        stack.alignment = .center
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(saleIcon)
        stack.addArrangedSubview(discountLabel)
        
        return stack
    }()
    
    lazy var chevronRightImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 20).isActive = true
        image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        return image
    }()
    
    lazy var buttonClear: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(getDiscount), for: .touchUpInside)
        return button
    }()
    
    @objc private func getDiscount() {
        print("231")
    }
    
    //MARK: - Payment coffee
    
    lazy var paymentSummaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Payment Summary"
        label.font = .customFont(type: .SoraSemiBold, size: 16)
        label.textColor = .black
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private func buyingcoffeeStack(title: String, pay: String) -> UIStackView {
        
        lazy var titleCount: UILabel = {
            let label = UILabel()
            label.text = title
            label.font = .customFont(type: .SoraRegular, size: 14)
            label.textColor = .black
            
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        lazy var payLabel: UILabel = {
            let label = UILabel()
            label.text = "\(pay)$"
            label.font = .customFont(type: .SoraSemiBold, size: 14)
            label.textColor = .black
            
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        lazy var stackInfomation: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fill
            
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview(titleCount)
            stack.addArrangedSubview(payLabel)
            
            return stack
        }()
        
        return stackInfomation
        
    }
    
    //MARK: - LyfeCycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        constraintsUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
//MARK: - Setup UI

extension BuyView{
    func setupUI(){
        addSubview(shopLabel)
        addSubview(cityLabel)
        addSubview(streetLabel)
        addSubview(buttonStack)
        addSubview(rectangleView)
        addSubview(yourOrderLabel)
        addSubview(orderCollectionView)
        addSubview(deviderView)
        addSubview(discountView)
        
        discountView.addSubview(stackSale)
        discountView.addSubview(chevronRightImage)
        discountView.addSubview(buttonClear)
        
        addSubview(paymentSummaryLabel)
        
        createButtons()
        
    }
    
    func constraintsUI(){
        NSLayoutConstraint.activate([
            shopLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            shopLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            
            cityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            cityLabel.topAnchor.constraint(equalTo: shopLabel.bottomAnchor, constant: 10),
            
            streetLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            streetLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10),
            
            buttonStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            buttonStack.topAnchor.constraint(equalTo: streetLabel.bottomAnchor, constant: 10),
            
            rectangleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            rectangleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            rectangleView.topAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: 20),
            rectangleView.heightAnchor.constraint(equalToConstant: 1),
            
            yourOrderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            yourOrderLabel.topAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: 15),
            
            orderCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            orderCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            orderCollectionView.topAnchor.constraint(equalTo: yourOrderLabel.bottomAnchor, constant: 10),
            orderCollectionView.heightAnchor.constraint(equalToConstant: 140),
            
            deviderView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            deviderView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            deviderView.topAnchor.constraint(equalTo: orderCollectionView.bottomAnchor, constant: 20),
            deviderView.heightAnchor.constraint(equalToConstant: 1),
            
            discountView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            discountView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            discountView.topAnchor.constraint(equalTo: deviderView.bottomAnchor, constant: 15),
            discountView.heightAnchor.constraint(equalToConstant: 58),
            
            stackSale.leadingAnchor.constraint(equalTo: discountView.leadingAnchor, constant: 15),
            stackSale.centerYAnchor.constraint(equalTo: discountView.centerYAnchor),
            
            chevronRightImage.trailingAnchor.constraint(equalTo: discountView.trailingAnchor, constant: -15),
            chevronRightImage.centerYAnchor.constraint(equalTo: discountView.centerYAnchor),
            
            buttonClear.leadingAnchor.constraint(equalTo: discountView.leadingAnchor),
            buttonClear.trailingAnchor.constraint(equalTo: discountView.trailingAnchor),
            buttonClear.bottomAnchor.constraint(equalTo: discountView.bottomAnchor),
            buttonClear.topAnchor.constraint(equalTo: discountView.topAnchor),
            
            paymentSummaryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            paymentSummaryLabel.topAnchor.constraint(equalTo: discountView.bottomAnchor, constant: 15),
        ])
    }
}

//
//  HomeView.swift
//  LuckCoffee
//
//  Created by Drolllted on 14.04.2024.
//

import UIKit

class HomeView: UIView{
    //MARK: Create UIModels
    
    private let scrollViewMain: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backgroundBrownView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.heightAnchor.constraint(equalToConstant: 350).isActive = true
        return view
    }()
    
    //MARK: LocationViews
    
    lazy var locationText: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.font = UIFont(name: "", size: 13)
        label.textColor = .gray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cityText: UILabel = {
        let label = UILabel()
        label.text = "Kolpino, Saint-P"
        label.font = UIFont(name: "", size: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var coffeeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "CoffeeImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return imageView
    }()
    
    //MARK: CreateTextField Button
    
    
    lazy var buttonTextField: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        return button
    }()
    
    lazy var magnifuImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        return imageView
    }()
    
    lazy var placeholderTextInButton: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .gray
        label.text = "Search Coffee"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44).isActive = true
        return button
    }()
    
    //MARK: SaleView
    
    lazy var rectangleSale: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 15
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 160).isActive = true
        return view
    }()
    
    var horizontalSlideMenu: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SlideMenuCell.self, forCellWithReuseIdentifier: SlideMenuCell.identifire)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return collectionView
    }()
    
     var coffeeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()
    
    
    
    //MARK: LifeCycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        setScrollView()
        
        setViewMain()
        
        setBackgroundView()
        
        locationWithImage()
        
        buttonTF()
        
        saleView()
        
        setHorizontalSlideMenu()
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTap() {
        print("111")
    }
    
    //MARK: FunctionForSetup
    
    private func locationWithImage() {
        setLocationLabel()
        
        setCityLabel()
        
        setCoffeeImage()
    }
    
    private func buttonTF() {
        setTextFieldButton()
        
        setMagnugugglassImage()
        
        setPlaceholderText()
        
        setRightButton()
    }
    
    private func saleView() {
        setSaleView()
    }
    
    //MARK: SetupUI
    
    private func setScrollView() {
        addSubview(scrollViewMain)
        
        NSLayoutConstraint.activate([
            scrollViewMain.topAnchor.constraint(equalTo: self.topAnchor),
            scrollViewMain.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollViewMain.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollViewMain.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setViewMain() {
        scrollViewMain.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: scrollViewMain.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: scrollViewMain.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: scrollViewMain.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: scrollViewMain.bottomAnchor),
            
            mainView.widthAnchor.constraint(equalTo: scrollViewMain.widthAnchor),
            mainView.heightAnchor.constraint(equalTo: scrollViewMain.heightAnchor)
        ])
    }
    
    private func setBackgroundView() {
        mainView.addSubview(backgroundBrownView)
        
        NSLayoutConstraint.activate([
            backgroundBrownView.topAnchor.constraint(equalTo: mainView.topAnchor),
            backgroundBrownView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            backgroundBrownView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
        ])
    }
    
    private func setLocationLabel() {
        backgroundBrownView.addSubview(locationText)
        
        NSLayoutConstraint.activate([
            locationText.leadingAnchor.constraint(equalTo: backgroundBrownView.leadingAnchor, constant: 25),
            locationText.topAnchor.constraint(equalTo: backgroundBrownView.topAnchor, constant: 70)
        ])
    }
    
    private func setCityLabel() {
        backgroundBrownView.addSubview(cityText)
        
        NSLayoutConstraint.activate([
            cityText.topAnchor.constraint(equalTo: locationText.bottomAnchor, constant: 10),
            cityText.leadingAnchor.constraint(equalTo: backgroundBrownView.leadingAnchor, constant: 25)
        ])
    }
    
    private func setCoffeeImage() {
        backgroundBrownView.addSubview(coffeeImage)
        
        NSLayoutConstraint.activate([
            coffeeImage.topAnchor.constraint(equalTo: backgroundBrownView.topAnchor, constant: 70),
            coffeeImage.trailingAnchor.constraint(equalTo: backgroundBrownView.trailingAnchor, constant: -25)
        ])
    }
    
    //MARK: Setup TextFieldButton
    
    private func setTextFieldButton() {
        backgroundBrownView.addSubview(buttonTextField)
        buttonTextField.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonTextField.topAnchor.constraint(equalTo: cityText.bottomAnchor, constant: 50),
            buttonTextField.leadingAnchor.constraint(equalTo: backgroundBrownView.leadingAnchor, constant: 25),
            buttonTextField.trailingAnchor.constraint(equalTo: backgroundBrownView.trailingAnchor, constant: -25)
        ])
    }
    
    private func setMagnugugglassImage() {
        buttonTextField.addSubview(magnifuImage)
        
        NSLayoutConstraint.activate([
            magnifuImage.leadingAnchor.constraint(equalTo: buttonTextField.leadingAnchor, constant: 15),
            magnifuImage.topAnchor.constraint(equalTo: buttonTextField.topAnchor, constant: 14)
            
        ])
        
    }
    
    private func setPlaceholderText() {
        buttonTextField.addSubview(placeholderTextInButton)
        
        NSLayoutConstraint.activate([
            placeholderTextInButton.leadingAnchor.constraint(equalTo: magnifuImage.trailingAnchor, constant: 15),
            placeholderTextInButton.topAnchor.constraint(equalTo: buttonTextField.topAnchor, constant: 17)
            
        ])
    }
    
    private func setRightButton() {
        buttonTextField.addSubview(rightButton)
        
        NSLayoutConstraint.activate([
            rightButton.trailingAnchor.constraint(equalTo: buttonTextField.trailingAnchor, constant: -6),
            rightButton.topAnchor.constraint(equalTo: buttonTextField.topAnchor, constant: 5)
        ])
    }
    
    
    //MARK: Setup SaleView
    
    private func setSaleView() {
        backgroundBrownView.addSubview(rectangleSale)
        
        NSLayoutConstraint.activate([
            rectangleSale.topAnchor.constraint(equalTo: buttonTextField.bottomAnchor, constant: 50),
            rectangleSale.leadingAnchor.constraint(equalTo: backgroundBrownView.leadingAnchor, constant: 25),
            rectangleSale.trailingAnchor.constraint(equalTo: backgroundBrownView.trailingAnchor, constant: -25)
        ])
    }
    
    
    private func setHorizontalSlideMenu() {
        mainView.addSubview(horizontalSlideMenu)
        
        NSLayoutConstraint.activate([
            horizontalSlideMenu.topAnchor.constraint(equalTo: rectangleSale.bottomAnchor, constant: 30),
            horizontalSlideMenu.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 25),
            horizontalSlideMenu.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
            
        ])
        
        
    }
    
    private func setCoffeeCollectionView() {
        mainView.addSubview(coffeeCollectionView)
        
        NSLayoutConstraint.activate([
            coffeeCollectionView.topAnchor.constraint(equalTo: horizontalSlideMenu.bottomAnchor, constant: 50),
            coffeeCollectionView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 25),
            coffeeCollectionView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -25)
        
        ])
    }
    
}

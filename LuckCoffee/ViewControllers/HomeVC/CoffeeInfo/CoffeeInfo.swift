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
    
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
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
    
    lazy var readMoreButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Read More", for: .normal)
        button.titleLabel?.font = .customFont(type: .SoraRegular, size: 14)
        button.titleLabel?.textAlignment = .left
        button.setTitleColor(.systemBrown, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var sizeLabel: UILabel = {
       let label = UILabel()
        label.text = "Size"
        label.font = .customFont(type: .SoraSemiBold, size: 16)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var collectionViewSize: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(SizeCell.self, forCellWithReuseIdentifier: SizeCell.identifire)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    //MARK: - WindowPrice
    
    lazy var windowPrice: UIView = {
        let view = UIView()
        view.roundCorners(corners: [.topLeft, .topRight], radius: 15)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setMainScrollView()
        
        setMainView()
        
        setImageCoffee()
        
        setLabelCoffee()
        
        setIngredientsLabel()
        
        setRatingButton()
        
        setRectangleView()
        
        setDiscriptionNameLabel()
        
        setDiscriptionLabel()
        
        setReadMoreButton()
        
        setSizeLabel()
        
        setSizeCollectionView()
        
        setWindowPrice()
    }
    
    private func setMainScrollView() {
        addSubview(mainScrollView)
        
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: self.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    private func setMainView() {
        mainScrollView.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            mainView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            
            mainView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            mainView.heightAnchor.constraint(equalTo: mainScrollView.heightAnchor),
        ])
    }
    
    private func setImageCoffee() {
        mainView.addSubview(imageCoffeeInfo)
        
        NSLayoutConstraint.activate([
            imageCoffeeInfo.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 15),
            imageCoffeeInfo.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor),
            imageCoffeeInfo.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setLabelCoffee() {
        mainView.addSubview(namedCoffeeInfo)
        
        NSLayoutConstraint.activate([
            namedCoffeeInfo.topAnchor.constraint(equalTo: imageCoffeeInfo.bottomAnchor, constant: 15),
            namedCoffeeInfo.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor),
            namedCoffeeInfo.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setIngredientsLabel() {
        mainView.addSubview(ingredientsCoffee)
        
        NSLayoutConstraint.activate([
            ingredientsCoffee.topAnchor.constraint(equalTo: namedCoffeeInfo.bottomAnchor, constant: 10),
            ingredientsCoffee.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor)
        ])
    }
    
    private func setRatingButton() {
        mainView.addSubview(ratingButton)
        
        NSLayoutConstraint.activate([
            ratingButton.topAnchor.constraint(equalTo: ingredientsCoffee.bottomAnchor, constant: 15),
            ratingButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor)
        ])
    }
    
    private func setRectangleView() {
        mainView.addSubview(rectangleView)
        
        NSLayoutConstraint.activate([
            rectangleView.topAnchor.constraint(equalTo: ratingButton.bottomAnchor, constant: 15),
            rectangleView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor),
            rectangleView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setDiscriptionNameLabel() {
        mainView.addSubview(discriptionName)
        
        NSLayoutConstraint.activate([
            discriptionName.topAnchor.constraint(equalTo: rectangleView.bottomAnchor, constant: 15),
            discriptionName.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor)
        ])
    }
    
    private func setDiscriptionLabel() {
        mainView.addSubview(discriptionLabel)
        
        NSLayoutConstraint.activate([
            discriptionLabel.topAnchor.constraint(equalTo: discriptionName.bottomAnchor, constant: 15),
            discriptionLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor),
            discriptionLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -anchor)
            
        ])
    }
    
    private func setReadMoreButton() {
        mainView.addSubview(readMoreButton)
        
        NSLayoutConstraint.activate([
            readMoreButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor),
            readMoreButton.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 5),
            readMoreButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setSizeLabel() {
        mainView.addSubview(sizeLabel)
        
        NSLayoutConstraint.activate([
            sizeLabel.topAnchor.constraint(equalTo: readMoreButton.bottomAnchor, constant: 15),
            sizeLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor),
            sizeLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -anchor)
        ])
    }
    
    private func setSizeCollectionView() {
        mainView.addSubview(collectionViewSize)
        
        NSLayoutConstraint.activate([
            collectionViewSize.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: anchor),
            collectionViewSize.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -anchor),
            collectionViewSize.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 15),
            collectionViewSize.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setWindowPrice() {
        window?.addSubview(windowPrice)
        window?.bringSubviewToFront(windowPrice)
        
        NSLayoutConstraint.activate([
//            windowPrice.leadingAnchor.constraint(equalTo: window!.leadingAnchor),
//            windowPrice.trailingAnchor.constraint(equalTo: window!.trailingAnchor),
//            windowPrice.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
}
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }
}

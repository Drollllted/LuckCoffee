//
//  CoffeeInfo.swift
//  LuckCoffee
//
//  Created by Drolllted on 13.05.2024.
//

import UIKit

class CoffeeInfoVC: UIViewController{
    
    private var isSelected: Bool = false
    var coffeeInfo: CoffeeInfo
    
    private var loveButton: UIBarButtonItem!
    
    let sizeMenu = ["S", "M", "L"]
    
    init() {
        self.coffeeInfo = CoffeeInfo()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = coffeeInfo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavBar()
        delegateCollectionViewSize()
        
    }
    
    //MARK: Setup NavBar
    
    func setupNavBar() {
        self.navigationItem.title = "Detail"

        loveButton = UIBarButtonItem(image: UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(didTapHeart))
        navigationItem.rightBarButtonItem = loveButton
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont(name: "Sora-Bold", size: 18)!]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withTintColor(.gray, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(backButtonAction))
        
        coffeeInfo.readMoreButton.addTarget(self, action: #selector(didTapReadMore), for: .touchUpInside)
    }
    
    //MARK: - Obj-c Method
    
    @objc func didTapReadMore() {
        coffeeInfo.discriptionLabel.numberOfLines = 20
        coffeeInfo.readMoreButton.isHidden = true
    }
    
    @objc func didTapHeart() {
        animateLoveButton()
        isSelected.toggle()
        
        do{
            guard let coffeeModel = coffeeInfo.coffeeModel else {return}
            if isSelected == true {
                let _ = CoreDataManager.shared.addToFavorites(coffee: coffeeModel)
                print("SucceessFully")
//             NotificationCenter.default.post(name: .updateFavoriteCoffees, object: nil)
            }else{
           //    let _ = try CoreDataManager.shared.deleteCoffees(coffee: coffeeModel)
                print("Coffee removed from favorites")
                
            }
        }
    }
    
    @objc func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Functions not @Objc
    
    private func animateLoveButton() {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.loveButton.tintColor = self?.isSelected ?? false ? UIColor(named: "LikedColor") ?? .red : .black
            self?.navigationController?.navigationBar.backgroundColor = self?.isSelected ?? false ? UIColor(named: "LikedColor")?.withAlphaComponent(0.1) ?? UIColor.red.withAlphaComponent(0.1) : .clear
        }) { [weak self] _ in
            UIView.animate(withDuration: 0.3, animations: {
                self?.navigationController?.navigationBar.backgroundColor = .clear
            })
        }
    }
    
    
    func delegateCollectionViewSize() {
        coffeeInfo.collectionViewSize.delegate = self
        coffeeInfo.collectionViewSize.dataSource = self
    }
    
}

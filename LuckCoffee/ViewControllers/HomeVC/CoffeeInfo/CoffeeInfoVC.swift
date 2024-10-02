//
//  CoffeeInfo.swift
//  LuckCoffee
//
//  Created by Drolllted on 13.05.2024.
//

import UIKit

final class CoffeeInfoVC: UIViewController{
    
    var coffeeInfo: CoffeeInfo!
    var detailModel: CoffeeModel?
    private var coreDataManaged = CoreDataManager.shared
    public var loveButton: UIBarButtonItem!
    var clouserIsSelected: ((CoffeeModel) -> Void)?
    
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
    
    func something() {
        let defaults = UserDefaults.standard
        let dict = defaults.dictionaryRepresentation()

        for (key, value) in dict {
            print("Key: \(key)")
            print("Value: \(value)")
            print("---")
        }
    }
    
    //MARK: Setup NavBar
    
    func setupNavBar() {
        self.navigationItem.title = "Detail"
        loveButton = UIBarButtonItem(image: UIImage(systemName: "heart")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal),
                                     style: .plain,
                                     target: self,
                                     action: #selector(didTapHeart))
        
        loveButton.image = detailModel!.isLiked ? UIImage(systemName: "heart.fill")?.withTintColor(UIColor(resource: .liked), renderingMode: .alwaysOriginal) : UIImage(systemName: "heart")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        
        navigationItem.rightBarButtonItem = loveButton
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont(name: "Sora-Bold", size: 18)!]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withTintColor(.gray, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(backButtonAction))
    }
    
    //MARK: - Obj-c Method
    
    @objc func didTapHeart() {
        addOrDelete()
    }
    
    @objc func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Functions not @Objc
    
    func delegateCollectionViewSize() {
        coffeeInfo.collectionViewSize.delegate = self
        coffeeInfo.collectionViewSize.dataSource = self
    }
    
    func addOrDelete() {
        guard let nameCoffee = detailModel?.nameCoffee,
              var coffeeModel = detailModel else {
            print("Guard failed: coffeeModel or nameCoffee is nil")
            return
        }
        
        print(nameCoffee)
        do{
            if coffeeModel.isLiked {
                coreDataManaged.deleteCoffees(coffeeName: nameCoffee)
                clouserIsSelected!(coffeeModel)
                print("Coffee removed from favorites")
            }else{
                coreDataManaged.addToFavorites(coffee: coffeeModel)
                clouserIsSelected!(coffeeModel)
                print("SucceessFully")
            }
            coffeeModel.isLiked.toggle()
            
            loveButton.image = coffeeModel.isLiked ? UIImage(systemName: "heart.fill")?.withTintColor(UIColor(resource: .liked), renderingMode: .alwaysOriginal) : UIImage(systemName: "heart")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        }
        
        print("Is selected: \(coffeeModel.isLiked)")
        print("Current favorites count: \(CoreDataManager.shared.coffee.count)")
    }
}

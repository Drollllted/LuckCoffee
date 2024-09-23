//
//  CoffeeInfo.swift
//  LuckCoffee
//
//  Created by Drolllted on 13.05.2024.
//

import UIKit

final class CoffeeInfoVC: UIViewController{
    
    private var isSelected: Bool = false
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
    
    //MARK: Setup NavBar
    
    func setupNavBar() {
        self.navigationItem.title = "Detail"
        loveButton = UIBarButtonItem(image: UIImage(systemName: "heart")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal),
                                     style: .plain,
                                     target: self,
                                     action: #selector(didTapHeart))
        
        navigationItem.rightBarButtonItem = loveButton
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont(name: "Sora-Bold", size: 18)!]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withTintColor(.gray, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(backButtonAction))
        
        guard isSelected == detailModel?.isLiked else {return}
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
    
    #warning("Отработать нажатие кнопки чтобы кнопка сохраняла свое состояние после нажатия на нее")
    
    func addOrDelete() {
        guard let nameCoffee = detailModel?.nameCoffee,
              var coffeeModel = detailModel else {
            print("Guard failed: coffeeModel or nameCoffee is nil")
            return
        }
        
        print(nameCoffee)
        do{
            if isSelected {
                coreDataManaged.deleteCoffees(coffeeName: nameCoffee)
                coffeeModel.isLiked = false
                clouserIsSelected?(coffeeModel)
                print("Coffee removed from favorites")
            }else{
                coreDataManaged.addToFavorites(coffee: coffeeModel)
                coffeeModel.isLiked = true
                clouserIsSelected?(coffeeModel)
                print("SucceessFully")
            }
            isSelected.toggle()
            
            loveButton.image = isSelected ? UIImage(systemName: "heart.fill")?.withTintColor(UIColor(resource: .liked), renderingMode: .alwaysOriginal) : UIImage(systemName: "heart")?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
            
        }
        
        NotificationCenter.default.post(name: .getUpdates, object: nil)
        print("Is selected: \(isSelected)")
        print("Current favorites count: \(CoreDataManager.shared.coffee.count)")
    }
    
}

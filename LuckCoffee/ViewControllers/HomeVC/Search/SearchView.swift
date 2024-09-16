//
//  SearchView.swift
//  LuckCoffee
//
//  Created by Drolllted on 16.09.2024.
//

import UIKit

class SearchView: UIView {
    
    lazy var backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor(resource: .backgroundRectangle).cgColor
        view.layer.borderWidth = 2
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var searchTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .line
        tf.placeholder = "Search Coffee..."
        tf.textColor = .white
        tf.backgroundColor = .clear
        tf.keyboardType = .default
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupVC()
        constraintsUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension SearchView{
    func setupVC(){
        backgroundColor = .systemBackground
    }
    
    func setupUI(){
        
    }
    
    func constraintsUI(){
        
    }
}

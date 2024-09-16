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
        tf.layer.cornerRadius = 15
        
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
        addSubview(backView)
        backView.addSubview(searchTextField)
    }
    
    func constraintsUI(){
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            backView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            backView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            backView.heightAnchor.constraint(equalToConstant: 50),
            
            searchTextField.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            searchTextField.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -5),
            searchTextField.topAnchor.constraint(equalTo: backView.topAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
        ])
    }
}

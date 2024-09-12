//
//  Extension+SizeCell.swift
//  LuckCoffee
//
//  Created by Drolllted on 06.08.2024.
//

import UIKit


extension CoffeeInfoVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sizeMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeCell.identifire, for: indexPath) as? SizeCell else {fatalError("What's with size CV?")}
        let menu = sizeMenu[indexPath.item]
        cell.sizeLabel.text = menu
        return cell
    }
    
}

extension CoffeeInfoVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let minColumnWidth = availableWidth / 3
        let maxNumColumns = Int(availableWidth / minColumnWidth)
        let cellWidth = ((availableWidth / CGFloat(maxNumColumns) - 5)).rounded(.down)
        
        return CGSize(width: cellWidth, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
}

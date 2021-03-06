//
//  BoxHeroesCell.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 02/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit


class BoxHeroesCell: CollectionViewCell {
    
    var sectionIndex: Int = 0
    
    var items = [ItemHeroes]() {
      didSet {
        collectionView.reloadData()
      }
    }
    
     @IBOutlet private weak var widthConstraint: NSLayoutConstraint!
        
    @IBOutlet private weak var collectionView: UICollectionView! {
      didSet {
        collectionView.scrollsToTop = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nibName = UINib(nibName: HeroesCell.identifier, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: HeroesCell.identifier)
      }
    }
}

extension BoxHeroesCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroesCell.identifier, for: indexPath) as! HeroesCell
        cell.configure(item: items[indexPath.row], at: IndexPath(item: indexPath.row, section: sectionIndex))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellDelegate?.didSelected(indexPath: IndexPath(row: indexPath.row, section: sectionIndex))
    }
    
}

extension BoxHeroesCell: UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 140, height: 230)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0, left: 24, bottom: 0, right: 24)
    }
}

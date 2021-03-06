//
//  SectionsHeros.swift
//  Marvel Heroes
//
//  Created by Thiago Vaz on 02/06/20.
//  Copyright © 2020 Thiago Santos. All rights reserved.
//

import UIKit

class SectionsHeros: Sections {
    
    override func direction() -> UICollectionView.ScrollDirection {
        .horizontal
    }
    
    override func header() -> CollectionViewHeader.Type? {
        HereosHeader.self
    }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        BoxHeroesCell.self
    }
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let cell = cell as? BoxHeroesCell, let itemsHeroes = items as? [AlienEntity]  {
            cell.items = itemsHeroes.map({ ItemMake.mapping(alien: $0) })
            cell.sectionIndex = indexPath.section
        }
    }
    
    override func willDisplayHeader(_ headerView: CollectionViewHeader) {
        if let header = headerView as? HereosHeader {
            header.configure(name: name)
        }
    }
    
    override func getCellSize(_ cell: CollectionViewCell.Type, for indexPath: IndexPath) -> CGSize {
        .init(width: UIScreen.main.bounds.width, height: 260)
    }
    
    override func didSelected(indexPath: IndexPath) {
        guard let alien = items[indexPath.row] as? AlienEntity else {
            return
        }
        
        (delegate as? SectionsHerosDelegate)?.didSelected(alien: alien, idHero: "SectinId: \(indexPath.section) - row \(indexPath.row)")
    }
}

protocol SectionsHerosDelegate: SectionDelegate {
    func didSelected(alien: AlienEntity, idHero: String)
}

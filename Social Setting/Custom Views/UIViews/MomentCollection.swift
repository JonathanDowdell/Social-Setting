//
//  SSCollectionView.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 2/7/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class MomentCollection: UICollectionView, UICollectionViewDelegateFlowLayout {
    
    override convenience init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.init(frame: frame, collectionViewLayout: layout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        self.register(MomentCollectionCell.self, forCellWithReuseIdentifier: MomentCollectionCell.reuseIdentifier)
        self.backgroundColor = .systemBlue
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 78)
    }
    
}

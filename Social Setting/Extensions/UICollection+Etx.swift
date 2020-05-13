//
//  UICollection+Etx.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 3/28/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    convenience init(scrollDirection: UICollectionView.ScrollDirection, spacing: CGFloat = 10) {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = spacing
        layout.scrollDirection = scrollDirection
        self.init(frame: .zero, collectionViewLayout: layout)
    }
}

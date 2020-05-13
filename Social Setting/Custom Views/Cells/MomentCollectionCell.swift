//
//  MomentCellCollectionViewCell.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 2/7/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class MomentCollectionCell: UICollectionViewCell {
    
    static let reuseIdentifier = "MomentCellCollectionViewCell"
    
    private let image = SSAvatarImageButton(squadSize: 65, image: UIImage(named: "Pic"))
    private let momentTitleLabel = SSTitleLabel(textAlignment: .center, fontSize: 12, title: "google")
    private lazy var vStack = SSUIStackView(arrangedSubviews: [UIView(),image,momentTitleLabel], axis: .vertical)
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        momentTitleLabel.font = .preferredFont(forTextStyle: .footnote)
        momentTitleLabel.textColor = DefaultStyles.Colors.SSGray79
        
        self.backgroundColor = .tertiarySystemBackground
        
        self.addSubview(image)
        self.addSubview(momentTitleLabel)
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image.topAnchor.constraint(equalTo: self.topAnchor),
            momentTitleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            momentTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  PostUserInfoStack.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/22/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class PostUserInfoStack: SSUIStackView {
    
    let avatarImage = SSButton(squareSize: 50, image: UIImage(named: "avatar50px"))
    let profileUsername = SSButton(backgroundColor: .clear, title: "Eliza Sanchez", font: .systemFont(ofSize: 14, weight: .bold))
    .editColor(DefaultStyles.Colors.SSLabelColor)
    let postTimeStamp = SSTitleLabel(textAlignment: .left, font: .preferredFont(forTextStyle: .footnote), title: "2 min ago")
    .editColor(with: .secondaryLabel)
    lazy var subProfileInfoStack = SSUIStackView(arrangedSubviews: [profileUsername, postTimeStamp], axis: .vertical)
        .editDistribution(.fillEqually).editSpacing(-10)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addArrangedSubview(avatarImage)
        self.addArrangedSubview(subProfileInfoStack)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

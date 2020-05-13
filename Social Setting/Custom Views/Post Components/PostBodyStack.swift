//
//  PostBodyStack.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/22/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class PostBodyStack: SSUIStackView {
    
    let postBodyText = SSTitleLabel(textAlignment: .left, font: .systemFont(ofSize: 16), title: "Life is Good!")
    let postMediaView = SSMediaImageView(frame: .zero)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        postMediaView.height.constant = 0 // 300
        postBodyText.numberOfLines = 0
        self.addArrangedSubviews([postBodyText,postMediaView])
        setCustomSpacing(15, after: postMediaView)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

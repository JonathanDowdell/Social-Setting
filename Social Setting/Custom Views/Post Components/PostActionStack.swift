//
//  PostActionStack.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/22/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class PostActionStack: SSUIStackView {
    
    let likePostBtn = SSPostButton(image: UIImage(systemName: "heart.fill"), title: "61")
    let commentPostBtn = SSPostButton(image: UIImage(systemName: "arrowshape.turn.up.left.fill"), title: "417")
    let sharePostBtn = SSPostButton(image: UIImage(systemName: "paperplane.fill"), title: "3")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.addArrangedSubviews([likePostBtn,commentPostBtn,sharePostBtn])
        self.distribution = .fillEqually
        
//        commentPostBtn.backgroundColor = .systemBlue
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

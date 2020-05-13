//
//  SSMediaImageView.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/22/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class SSMediaImageView: UIImageView {

    var height: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "imageplaceholder100px")
        self.backgroundColor = UIColor("F4F6F6")
        self.translatesAutoresizingMaskIntoConstraints = false
        self.height = self.heightAnchor.constraint(equalToConstant: 166)
        self.height.isActive = true
        self.layer.cornerRadius = 6
        self.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

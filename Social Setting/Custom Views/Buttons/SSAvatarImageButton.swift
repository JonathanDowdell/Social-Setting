//
//  SSAvatarImageButton.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/17/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class SSAvatarImageButton: UIImageView {
    
    init(squadSize: CGFloat, image: UIImage? = UIImage(named: "avatar50px")) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: squadSize),
            self.widthAnchor.constraint(equalToConstant: squadSize)
        ])
        self.layer.cornerRadius = (squadSize != 0) ? squadSize / 2 : 0
        self.clipsToBounds = true
        self.image = image?.withRenderingMode(.alwaysOriginal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.alpha = 0.2
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.alpha = 1
        }
    }

}

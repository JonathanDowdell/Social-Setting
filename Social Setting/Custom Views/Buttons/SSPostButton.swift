//
//  SSPostButton.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/22/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class SSPostButton: UIButton {
    
    required init(image: UIImage?, title: String?) {
        super.init(frame: .zero)
        self.setImage(image?.withTintColor(DefaultStyles.Colors.SSGray79, renderingMode: .alwaysOriginal), for: .normal)
        self.setTitle(title, for: .normal)
        self.setTitleColor(DefaultStyles.Colors.SSGray79, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.titleLabel?.alpha = 0.2
            self.imageView?.alpha = 0.2
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.1) {
            self.titleLabel?.alpha = 1
            self.imageView?.alpha = 1
        }
    }
    
}

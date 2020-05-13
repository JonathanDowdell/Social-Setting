//
//  UIButton+Etx.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/17/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

extension UIButton {
    func setFont(_ font: UIFont) -> UIButton {
        self.titleLabel?.font = font
        return self
    }
    
    func setText(_ text: String) -> UIButton {
        self.setTitle(text, for: .normal)
        return self
    }
    
    func setTextColor(_ color: UIColor) -> UIButton {
        self.setTitleColor(color, for: .normal)
        return self
    }
    
    func setTextAlignment(_ textAlignment: ContentHorizontalAlignment) -> UIButton {
        self.contentHorizontalAlignment = .left
        return self
    }
}

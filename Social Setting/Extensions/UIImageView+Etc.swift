//
//  UIImageView+Etc.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/17/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

extension UIImageView {
    
    convenience init (frame: CGRect, image: UIImage?) {
        self.init(frame: frame)
        self.image = image
        self.contentMode = .scaleAspectFit
        self.clipsToBounds = true
    }
    
    
}

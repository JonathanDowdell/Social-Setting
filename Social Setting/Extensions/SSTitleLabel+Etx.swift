//
//  SSTitleLabel+Etx.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 2/5/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

extension SSTitleLabel {
    
    func setText(_ text: String?) -> SSTitleLabel {
        self.text = text
        return self
    }
    
    func setTextColor(_ color: UIColor) -> SSTitleLabel {
        self.textColor = color
        return self
    }
    
    func setNumberOfLines(_ numberOfLines: Int) -> SSTitleLabel {
        self.numberOfLines = numberOfLines
        return self
    }
    
}

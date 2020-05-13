//
//  SSFeedLabel.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 5/1/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class SSFeedLabel: SSTitleLabel {
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: 0)
        super.drawText(in: rect.inset(by: insets))
    }
}

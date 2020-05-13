//
//  SSUIStackView.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/16/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class SSUIStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.spacing = 10
    }

    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis ) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        
    }
    
    func editSpacing(_ spacing: CGFloat) -> SSUIStackView {
        self.spacing = spacing
        return self
    }
    
    func editDistribution(_ distribution: UIStackView.Distribution) -> SSUIStackView {
        self.distribution = distribution
        return self
    }
    
    func editCustomSpacing(_ spacing: CGFloat, after: UIView) -> SSUIStackView {
        self.setCustomSpacing(spacing, after: after)
        return self
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

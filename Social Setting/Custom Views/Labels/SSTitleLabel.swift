//
//  SSTitleLabel.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/15/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class SSTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat, title: String? = nil) {
        super.init(frame: .zero)
        configure()
        self.textAlignment = textAlignment
        self.text = title
    }
    
    init(textAlignment: NSTextAlignment, font: UIFont, title: String? = nil) {
        super.init(frame: .zero)
        configure()
        self.font = font
        self.textAlignment = textAlignment
        self.text = title
    }
    
    func editColor(with color: UIColor) -> SSTitleLabel {
        self.textColor = color
        return self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.textColor = DefaultStyles.Colors.SSLabelColor
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.9
        self.lineBreakMode = .byTruncatingTail
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesBegan(presses, with: event)
        print("Press Began")
    }
    
}

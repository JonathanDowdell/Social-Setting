//
//  SSTextField.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/15/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class SSTextField: UITextField {
    
    let insets: UIEdgeInsets
    
    init(inset: UIEdgeInsets, placeholder: String? = nil, isSecure: Bool = false) {
        self.insets = inset
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 6
        self.backgroundColor = DefaultStyles.Colors.SSGray19
        self.attributedPlaceholder = NSAttributedString(string: " ", attributes: [
            NSAttributedString.Key.foregroundColor : DefaultStyles.Colors.SSLabelColor.withAlphaComponent(0.60)])
        self.textColor = DefaultStyles.Colors.SSLabelColor
        self.clearButtonMode = .whileEditing
        self.isSecureTextEntry = isSecure
        self.placeholder = placeholder
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
}

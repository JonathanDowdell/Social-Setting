//
//  StatLabel.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 2/7/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class StatLabel: UILabel {
    
    init(title: String, count: Int = 11) {
        super.init(frame: .zero)
        self.numberOfLines = 0
        let string = NSMutableAttributedString(string: "\(count)K", attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : DefaultStyles.Colors.SSLabelColor
        ])
        string.append(NSAttributedString(string: "\n\(title)", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor : UIColor("969FA2")
        ]))
        self.attributedText = string
        self.textAlignment = .center
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.numberOfLines = 0
        let string = NSMutableAttributedString(string: "11K", attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : DefaultStyles.Colors.SSLabelColor
        ])
        string.append(NSAttributedString(string: "\nPosts", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : UIColor("969FA2")
        ]))
        self.attributedText = string
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  SSButton.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/16/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class SSButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(frame: CGRect, image: UIImage?) {
        self.init(frame: frame)
        self.setImage(image, for: .normal)
    }
    
    convenience init(squareSize: CGFloat, image: UIImage?) {
        self.init(frame: CGRect(x: 0, y: 0, width: squareSize, height: squareSize))
        self.layer.cornerRadius = squareSize / 2
        self.setImage(image, for: .normal)
        self.clipsToBounds = true
    }
    
    init(backgroundColor: UIColor, title: String, font: UIFont = UIFont.preferredFont(forTextStyle: .headline)) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
        self.titleLabel?.font = font
    }
    
    func editColor(_ color: UIColor) -> SSButton {
        self.setTitleColor(color, for: .normal)
        return self
    }
    
    private func configure() {
        self.layer.cornerRadius =  6
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        self.translatesAutoresizingMaskIntoConstraints = false
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

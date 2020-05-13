//
//  UIVIew+Etx.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/17/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

extension UIView {
    func animateOut(completed: @escaping () -> Void) {
        let overlayView = UIView()
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.backgroundColor = .tertiarySystemBackground
        overlayView.alpha = 0
        self.addSubview(overlayView)
        NSLayoutConstraint.activate([
            overlayView.widthAnchor.constraint(equalTo: self.widthAnchor),
            overlayView.heightAnchor.constraint(equalTo: self.heightAnchor),
            overlayView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            overlayView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        UIView.animate(withDuration: 0.3) {
        }
        UIView.animate(withDuration: 0.3, animations: {
            overlayView.alpha = 1
        }) { (_) in
            completed()
        }
    }
}

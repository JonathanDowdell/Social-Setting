//
//  UIStackView+Etx.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/22/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { (view) in
            self.addArrangedSubview(view)
        }
    }
}

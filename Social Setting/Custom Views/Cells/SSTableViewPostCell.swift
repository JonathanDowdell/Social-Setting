//
//  SSTableViewPostCell.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/21/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class SSTableViewPostCell: UITableViewCell {
    
    static let reuseIdentifier = "SSTableViewPostCell"
    
    let menuButton = SSButton(squareSize: 24, image: UIImage(systemName: "ellipsis")?
        .withTintColor(DefaultStyles.Colors.SSGray79, renderingMode: .alwaysOriginal))
    
    let seperator = SSUISeperator(height: 1, color: DefaultStyles.Colors.SSSeperatorColor)
    
    let profileInfoMainStack = PostUserInfoStack()
    let postBodyStack = PostBodyStack()
    let postActionButtonStack = PostActionStack()

    let lastSeperator = SSUISeperator(height: 10, color: DefaultStyles.Colors.SSGray19)
    
    fileprivate func configureProfileStack() {
        self.addSubview(profileInfoMainStack)
        self.addSubview(menuButton)
        NSLayoutConstraint.activate([
            profileInfoMainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            profileInfoMainStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            menuButton.centerYAnchor.constraint(equalTo: profileInfoMainStack.centerYAnchor),
            menuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            menuButton.heightAnchor.constraint(equalTo: profileInfoMainStack.heightAnchor)
        ])
    }
    
    fileprivate func configureBodyStack() {
        self.addSubview(postBodyStack)
        NSLayoutConstraint.activate([
            postBodyStack.leadingAnchor.constraint(equalTo: profileInfoMainStack.leadingAnchor),
            postBodyStack.topAnchor.constraint(equalTo: profileInfoMainStack.bottomAnchor, constant: 15),
            postBodyStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    fileprivate func configureBottomSeperator() {
        self.addSubview(lastSeperator)
        NSLayoutConstraint.activate([
            lastSeperator.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lastSeperator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lastSeperator.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    fileprivate func configureActionButtonStack() {
        self.addSubview(seperator)
        self.addSubview(postActionButtonStack)
        NSLayoutConstraint.activate([
            postActionButtonStack.bottomAnchor.constraint(equalTo: lastSeperator.topAnchor, constant: -5),
            postActionButtonStack.leadingAnchor.constraint(equalTo: postBodyStack.leadingAnchor),
            postActionButtonStack.trailingAnchor.constraint(equalTo: postBodyStack.trailingAnchor),
            postActionButtonStack.heightAnchor.constraint(equalToConstant: 54),
            seperator.bottomAnchor.constraint(equalTo: postActionButtonStack.topAnchor, constant: -5),
            seperator.leadingAnchor.constraint(equalTo: postActionButtonStack.leadingAnchor),
            seperator.trailingAnchor.constraint(equalTo: postActionButtonStack.trailingAnchor),
            postBodyStack.bottomAnchor.constraint(lessThanOrEqualTo: seperator.topAnchor, constant: -5)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .tertiarySystemBackground
        self.selectionStyle = .none
        configureProfileStack()
        configureBodyStack()
        configureBottomSeperator()
        configureActionButtonStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

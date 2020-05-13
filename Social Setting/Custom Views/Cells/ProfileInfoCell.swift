//
//  ProfileInfoCell.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 2/7/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class ProfileInfoCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let reuseIdentifier = "ProfileInfoCell"
    
    private let avatarImage = SSAvatarImageButton(squadSize: 100, image: UIImage(named: "avatar100px"))
    private let profileName = SSTitleLabel(textAlignment: .left, font: .systemFont(ofSize: 18, weight: .bold)).setText("Jonathan")
    private let subProfileInfo = SSTitleLabel(textAlignment: .left, font: .systemFont(ofSize: 16)).setText("Technology")
        .setTextColor(DefaultStyles.Colors.SSGray79)
    private let bioText = SSTitleLabel(textAlignment: .left, font: .systemFont(ofSize: 16))
        .setText("Software Engineer 👨🏾‍💻 \nvar languages:[lang] = [Java, Swift, JS, Angular] \nLogic-based creativity")
        .setNumberOfLines(0)
    private let postStat = StatLabel(title: "Posts")
    private let followerStat = StatLabel(title: "Followers", count: 56)
    private let followingStat = StatLabel(title: "Following", count: 2)
    private let actionButton = SSButton(backgroundColor: DefaultStyles.Colors.SSBaseColor, title: "FOLLOW")
    private let messageButton = UIButton(type: .system)
    private let websiteButton = UIButton(type: .system)
        .setText("mettaworldj.com").setFont(.boldSystemFont(ofSize: 16))
        .setTextColor(DefaultStyles.Colors.SSBaseColor)
        .setTextAlignment(.leading)
    
    private let momentCollection = UICollectionView(scrollDirection: .horizontal, spacing: 5)
    
    private lazy var statHStack = SSUIStackView(arrangedSubviews: [postStat,followerStat,followingStat], axis: .horizontal)
        .editDistribution(.equalSpacing)
    private lazy var buttonHStack = SSUIStackView(arrangedSubviews: [actionButton, messageButton], axis: .horizontal)
    private lazy var vStack = SSUIStackView(arrangedSubviews: [UIView(), statHStack,buttonHStack, UIView()], axis: .vertical)
        .editCustomSpacing(12, after: statHStack)
    private lazy var hStack = SSUIStackView(arrangedSubviews: [avatarImage, vStack], axis: .horizontal)
        .editDistribution(.fillProportionally)
    private lazy var mainVStack = SSUIStackView(arrangedSubviews: [hStack, profileName,subProfileInfo, bioText, websiteButton], axis: .vertical)
        .editCustomSpacing(10, after: hStack)
        .editCustomSpacing(2, after: profileName)
        .editCustomSpacing(1.5, after: bioText)
    private let lastSeperator = SSUISeperator(height: 10, color: DefaultStyles.Colors.SSGray19)
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .tertiarySystemBackground
        self.selectionStyle = .none
        
        self.addSubview(mainVStack)
        NSLayoutConstraint.activate([
            mainVStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            mainVStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            mainVStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            actionButton.heightAnchor.constraint(equalToConstant: 32),
            messageButton.heightAnchor.constraint(equalToConstant: 32),
            messageButton.widthAnchor.constraint(equalToConstant: 65)
        ])
        
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .heavy)
        actionButton.layer.cornerRadius = 16
        actionButton.contentHorizontalAlignment = .left
        actionButton.backgroundColor = DefaultStyles.Colors.SSBaseColor
        actionButton.setImage(UIImage(systemName: "person.badge.plus.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        let edge = UIScreen.main.bounds.width - 266
        actionButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: edge, bottom: 0, right: -edge)
        actionButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 15)
        actionButton.setTitleColor(.white, for: .normal)
        
        
        messageButton.setImage(UIImage(named: "message.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.backgroundColor = DefaultStyles.Colors.SSGray19
        messageButton.layer.cornerRadius = 16
        
        momentCollection.delegate = self
        momentCollection.dataSource = self
        momentCollection.register(MomentCollectionCell.self, forCellWithReuseIdentifier: MomentCollectionCell.reuseIdentifier)
        momentCollection.backgroundColor = .tertiarySystemBackground
        momentCollection.alwaysBounceHorizontal = true
        momentCollection.translatesAutoresizingMaskIntoConstraints = false
        momentCollection.showsHorizontalScrollIndicator = false
        
        self.addSubview(momentCollection)
        self.addSubview(lastSeperator)
        NSLayoutConstraint.activate([
            lastSeperator.widthAnchor.constraint(equalTo: self.widthAnchor),
            lastSeperator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lastSeperator.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            momentCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            momentCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            momentCollection.bottomAnchor.constraint(equalTo: lastSeperator.topAnchor, constant: -25),
            momentCollection.heightAnchor.constraint(equalToConstant: 95)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileInfoCell {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MomentCollectionCell.reuseIdentifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 77)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
    }
}

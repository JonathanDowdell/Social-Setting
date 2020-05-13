//
//  SSWhatsNewCell.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/17/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit
import RSKPlaceholderTextView

protocol SSWhatsNewDelegate: class {
    func startedEditing()
}

class SSWhatsNewCell: UITableViewCell {
    
    static let reuseIdentifier = "SSWhatsNewCell"
    weak var delegate: SSWhatsNewDelegate?
    
    private let avatar = SSAvatarImageButton(squadSize: 50)
    private let whatsNewLabel = RSKPlaceholderTextView()
    private let photoButton = SSButton(squareSize: 30, image: UIImage(named: "photo32px"))
    private let videoButton = SSButton(squareSize: 30, image: UIImage(named: "video32px"))
    private let locationButton = SSButton(squareSize: 30, image: UIImage(named: "location32px"))
    private let seperator = SSUISeperator(height: 1, color: DefaultStyles.Colors.SSSeperatorColor)
    private lazy var buttonStack = SSUIStackView(arrangedSubviews: [photoButton, videoButton, locationButton], axis: .horizontal)
    
    fileprivate func configure() {
        whatsNewLabel.translatesAutoresizingMaskIntoConstraints = false
        whatsNewLabel.placeholder = "What's new, Andrew?"
        whatsNewLabel.textColor = DefaultStyles.Colors.SSLabelColor
        whatsNewLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        whatsNewLabel.backgroundColor = .clear
        whatsNewLabel.delegate = self
        
        self.selectionStyle = .none
        self.backgroundColor = .tertiarySystemBackground
        self.addSubview(avatar)
        self.addSubview(whatsNewLabel)
        self.addSubview(buttonStack)
        self.addSubview(seperator)
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            buttonStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -23),
            whatsNewLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            whatsNewLabel.topAnchor.constraint(equalTo: avatar.centerYAnchor, constant: -16),
            whatsNewLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            whatsNewLabel.heightAnchor.constraint(equalToConstant: 120),
            buttonStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            seperator.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            seperator.widthAnchor.constraint(equalTo: self.widthAnchor),
            seperator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension SSWhatsNewCell: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        delegate?.startedEditing()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }
}

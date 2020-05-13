//
//  SignUpVC.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/16/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    private let facebookButton = SSButton(backgroundColor: DefaultStyles.Colors.SSBaseColor, title: "Login In With Facbook")
    private let spacingText = SSTitleLabel(textAlignment: .center, font: UIFont.preferredFont(forTextStyle: .footnote))
    private let firstNameTextField = SSTextField(inset: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15), placeholder: "First Name")
    private let lastNameTextField = SSTextField(inset: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15), placeholder: "Last Name")
    private let emailTextField = SSTextField(inset: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15), placeholder: "Email")
    private let passwordTextField = SSTextField(inset: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15), placeholder: "Password", isSecure: true)
    private let pwdConfirmTextField = SSTextField(inset: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15), placeholder: "Confirm Password", isSecure: true)
    private let continueButton = SSButton(backgroundColor: DefaultStyles.Colors.SSBaseColor, title: "Continue")
    private let termsButton = SSButton(backgroundColor: .clear, title: "Continue")
    private lazy var mainStack = SSUIStackView(arrangedSubviews: [
        facebookButton, spacingText, firstNameTextField, lastNameTextField, emailTextField, passwordTextField, pwdConfirmTextField, continueButton, termsButton], axis: .vertical)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureTextFields()
        configureButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configure() {
        view.backgroundColor = .tertiarySystemBackground
        view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing)))
    }
    
    private func configureTextFields() {
        textFieldDelegates()
        mainStack.spacing = 10
        view.addSubview(mainStack)
        NSLayoutConstraint.activate([
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 44),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 44),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 44),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            pwdConfirmTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureButtons() {
        mainStack.setCustomSpacing(20, after: pwdConfirmTextField)
        spacingText.text = "or signup with Email"
        spacingText.textColor = .secondaryLabel
        NSLayoutConstraint.activate([
            facebookButton.heightAnchor.constraint(equalToConstant: 48),
            continueButton.heightAnchor.constraint(equalToConstant: 48),
            spacingText.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        facebookButton.contentHorizontalAlignment = .left
        facebookButton.setTitleColor(DefaultStyles.Colors.SSLabelColor, for: .normal)
        facebookButton.backgroundColor = DefaultStyles.Colors.SSGray19
        facebookButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        facebookButton.setImage(UIImage(systemName: "arrow.up.right.circle")?.withTintColor(DefaultStyles.Colors.SSLabelColor, renderingMode: .alwaysOriginal), for: .normal)
        let edge = UIScreen.main.bounds.width - 108
        facebookButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: edge, bottom: 0, right: -edge)
        facebookButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 15)
        facebookButton.addTarget(self, action: #selector(continueSignUp), for: .touchUpInside)
        
        
        mainStack.setCustomSpacing(30, after: continueButton)
        let termText = NSMutableAttributedString(string: "By signing up, you agree to our\n", attributes: [NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .footnote), NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel])
        termText.append(NSAttributedString(string: " Terms ", attributes: [NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .callout), NSAttributedString.Key.foregroundColor : DefaultStyles.Colors.SSBaseColor]))
        termText.append(NSAttributedString(string: "and ", attributes: [NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .footnote), NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]))
        termText.append(NSAttributedString(string: " Privacy", attributes: [NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .callout), NSAttributedString.Key.foregroundColor : DefaultStyles.Colors.SSBaseColor]))
        termsButton.setAttributedTitle(termText, for: .normal)
        termsButton.titleLabel?.numberOfLines = 0
        termsButton.titleLabel?.textAlignment = .center
    }
    
    @objc private func continueSignUp() {
        
    }
}

extension SignUpVC: UITextFieldDelegate {
    
    private func textFieldDelegates() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        pwdConfirmTextField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.mainStack.transform = CGAffineTransform(translationX: 0, y: -95)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let extractedExpr: CGAffineTransform = CGAffineTransform.identity
        UIView.animate(withDuration: 0.3) {
            self.mainStack.transform = extractedExpr
        }
    }
    
}

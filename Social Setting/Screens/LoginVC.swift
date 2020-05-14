//
//  LoginVC.swift
//  Social Setting
//
//  Created by Jonathan Dowdell on 1/15/20.
//  Copyright © 2020 Jonathan Dowdell. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    private let titleLabel = SSTitleLabel(textAlignment: .left, font: .systemFont(ofSize: 36, weight: .bold))
    private let subTitleLabel = SSTitleLabel(textAlignment: .left, font: .systemFont(ofSize: 16))
    private let loginTextField = SSTextField(inset: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
    private let passwordTextField = SSTextField(inset: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15), isSecure: true)
    private let loginButton = SSButton(backgroundColor: DefaultStyles.Colors.SSBaseColor, title: "Login")
    private let forgotPwdButton = SSButton(backgroundColor: .clear, title: "Forgot Password?")
    private let signUpButton = SSButton(backgroundColor: DefaultStyles.Colors.SSGray19, title: "Sign Up")
    private lazy var textFieldStack = SSUIStackView(arrangedSubviews: [
        loginTextField, passwordTextField, loginButton], axis: .vertical)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureTitleLabel()
        configureSubTitleLabel()
        configureTextFields()
        configureButtons()
        self.view.animateIn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc private func loginUser() {
        guard let email = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        Network.shared.userService.signInUser(email: email, password: password) { (results) in
            switch results {
            case .success(let user):
                let sceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
                self.view.animateOut()
                sceneDelegate.switchTo(user: user)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @objc private func launchSignUpVC() {
        self.navigationController?.pushViewController(SignUpVC(), animated: true)
    }
    
    private func configure() {
        view.backgroundColor = .tertiarySystemBackground
        view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing)))
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "Welcome\nto Social Setting"
        loginTextField.autocapitalizationType = .none
        passwordTextField.autocapitalizationType = .none
        titleLabel.numberOfLines = 2
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    private func configureSubTitleLabel() {
        let lineBreak = UIDevice.current.iphoneSE ? " " : "\n"
        subTitleLabel.text = "In a world of clutter and mixed sentiment,\(lineBreak)do you stand out?"
        subTitleLabel.numberOfLines = 0
        view.addSubview(subTitleLabel)
        NSLayoutConstraint.activate([
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }

    private func configureTextFields() {
        loginTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        view.addSubview(textFieldStack)
        NSLayoutConstraint.activate([
           textFieldStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           textFieldStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
           textFieldStack.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 74),
           loginTextField.heightAnchor.constraint(equalToConstant: 44),
           passwordTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func configureButtons() {
        textFieldStack.setCustomSpacing(20, after: passwordTextField)
        textFieldStack.setCustomSpacing(25, after: loginButton)
        textFieldStack.addArrangedSubview(SSUIStackView(arrangedSubviews: [forgotPwdButton, UIView()], axis: .horizontal))
        
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        loginButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        
        forgotPwdButton.contentHorizontalAlignment = .left
        forgotPwdButton.setTitleColor(DefaultStyles.Colors.SSBaseColor, for: .normal)
        
        signUpButton.contentHorizontalAlignment = .left
        signUpButton.setTitleColor(DefaultStyles.Colors.SSLabelColor, for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        signUpButton.setImage(UIImage(systemName: "chevron.right")?.withTintColor(DefaultStyles.Colors.SSLabelColor, renderingMode: .alwaysOriginal), for: .normal)
        let edge = UIScreen.main.bounds.width - 108
        signUpButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: edge, bottom: 0, right: -edge)
        signUpButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 15)
        signUpButton.addTarget(self, action: #selector(launchSignUpVC), for: .touchUpInside)
        
        view.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 48),
            signUpButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            signUpButton.leadingAnchor.constraint(equalTo: textFieldStack.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: textFieldStack.trailingAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

extension LoginVC {
    
}

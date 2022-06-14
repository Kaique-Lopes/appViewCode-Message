//
//  LoginScreen.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 31/05/22.
//

import UIKit

class LoginScreen: UIView {
    
// MARK: - Components
    lazy var loginLabel = UILabelDefault(text: "Login")
    lazy var logoImage = UIImageDefault(imageName: "logo")
    lazy var loginTextField = UITextFieldDefault(text: "Email", keyboardType: .emailAddress, delegate: self)
    lazy var passwordTextField = UITextFieldDefault(text: "Senha", keyboardType: .default, isSecure: true, delegate: self)
    lazy var loginButton = UIButtonDefault(text: "Login", bgColor: .white, objcTarget: #selector(self.tappedLoginButton), forTarget: .touchDown)
    lazy var registerButton = UIButtonDefault(text: "Não tem Conta? Cadastre-se", bgColor: .clear, colorTitle: .cyan, objcTarget: #selector(self.tappedLoginButton), forTarget: .touchDown)

    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func tappedLoginButton() {}
    // MARK: - Constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.logoImage.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20),
            self.logoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.logoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.logoImage.heightAnchor.constraint(equalToConstant: 200),
            
            self.loginTextField.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor, constant: 20),
            self.loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 45),

            self.passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.loginTextField.heightAnchor),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            self.loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            self.loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.loginButton.heightAnchor)
        ])
    }
    
    // MARK: - ConfigViews
    func configViews() {
        self.addSubview(loginLabel)
        self.addSubview(logoImage)
        self.addSubview(loginTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
    }
    
}

// MARK: - UITextFieldDelegate
extension LoginScreen: UITextFieldDelegate {}

//
//  LoginScreen.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 31/05/22.
//

import UIKit

class LoginScreen: UIView {
    
// MARK: - Components
    lazy var loginLabel = LabelDefault(text: "Login")
    lazy var logoImage = UIImageDefault(imageName: "logo")
    lazy var loginTextField = UITextFieldDefault(text: "Email", keyboardType: .emailAddress)
    lazy var passwordTextField = UITextFieldDefault(text: "Senha", keyboardType: .default, isSecure: true)
    
    // MARK: - Overrides
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)

        ])
    }
    
    // MARK: - ConfigViews
    func configViews() {
        self.addSubview(loginLabel)
        self.addSubview(logoImage)
        self.addSubview(loginTextField)
        self.addSubview(passwordTextField)
    }
    
}

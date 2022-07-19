//
//  LoginScreen.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 31/05/22.
//

import UIKit

// MARK: - LoginScreenProtocol
protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
    func tappedRegisterButton()
}

class LoginScreen: UIView {
    
    // MARK: - loginScreenProtocol and loginScreenDelegate
    private weak var loginScreenProtocol: LoginScreenProtocol?
    
    func loginScreenDelegate(delegate: LoginScreenProtocol?){
        self.loginScreenProtocol = delegate
    }
    
// MARK: - Components
    lazy var loginLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Logo"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var logoImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "logo")
        return image
    }()
    
    lazy var loginTextField: UITextField = {
        var tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.placeholder = "Digite seu e-mail"
        tf.autocorrectionType = .no
        tf.borderStyle = .roundedRect
        tf.textColor = .darkGray
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        var tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.placeholder = "Senha"
        tf.autocorrectionType = .no
        tf.borderStyle = .roundedRect
        tf.textColor = .darkGray
        tf.keyboardType = .default
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.0
        return button
    }()
    
    lazy var registerButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.0
        return button
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configViews()
        self.setupConstraints()
        self.setLoginButton()
        self.setRegisterButton()
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
            self.loginTextField.heightAnchor.constraint(equalToConstant: 45),

            self.passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.loginTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.loginTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.loginTextField.heightAnchor)
        ])
    }
    
    // MARK: - ConfigViews
    func configViews() {
        self.addSubview(loginLabel)
        self.addSubview(logoImage)
        self.addSubview(loginTextField)
        self.addSubview(passwordTextField)
    }
    
    // MARK: - Private Methods
    private func setLoginButton() {
        self.addSubview(loginButton)
        
        self.loginButton.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)

        NSLayoutConstraint.activate([
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            self.loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            self.loginButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setRegisterButton() {
        self.addSubview(registerButton)
        
        self.registerButton.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.loginButton.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.loginButton.trailingAnchor)
        ])
    }
    
    @objc private func tappedLoginButton() {
        self.loginScreenProtocol?.tappedLoginButton()
    }
    
    @objc private func tappedRegisterButton() {
        self.loginScreenProtocol?.tappedRegisterButton()
    }
    
}

// MARK: - UITextFieldDelegate
extension LoginScreen: UITextFieldDelegate {}

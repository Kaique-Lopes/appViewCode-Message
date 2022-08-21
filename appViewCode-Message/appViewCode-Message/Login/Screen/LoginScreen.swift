//
//  LoginScreen.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 31/05/22.
//

import UIKit
import SnapKit

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
        tf.font = UIFont.systemFont(ofSize: 18)
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
        tf.placeholder = "Digite sua Senha"
        tf.font = UIFont.systemFont(ofSize: 18)
        tf.autocorrectionType = .no
        tf.borderStyle = .roundedRect
        tf.textColor = .darkGray
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.lightGray, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.0
        button.isEnabled = false
        return button
    }()
    
    lazy var registerButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se", for: .normal)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
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
        self.setupAllConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    // MARK: - Constraints
    func setupAllConstraints(){
        self.setupLoginLabelConstraint()
        self.setupLogoImageConstraint()
        self.setupLoginTextFieldConstraint()
        self.setupPasswordTextFieldConstraint()
        self.setupLoginButtonConstraint()
        self.setupRegisterButtonConstraint()
    }

    func setupLoginLabelConstraint() {
        self.loginLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupLogoImageConstraint() {
        self.logoImage.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(200)
        }
    }
    
    func setupLoginTextFieldConstraint() {
        self.loginTextField.snp.makeConstraints { make in
            make.top.equalTo(self.logoImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(35)
        }
    }
    
    func setupPasswordTextFieldConstraint() {
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.loginTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(self.passwordTextField.snp.height)
        }
    }
    
    func setupLoginButtonConstraint() {
        self.loginButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
            make.height.equalTo(40)
        }
    }
    
    func setupRegisterButtonConstraint() {
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(self.loginButton.snp.bottom).offset(20)
            make.leading.equalTo(self.loginButton.snp.leading)
            make.trailing.equalTo(self.loginButton.snp.trailing)
        }
    }
    
    func configTextFieldsDelegate(delegate: UITextFieldDelegate) {
        self.loginTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
        
    @objc private func tappedLoginButton() {
        self.loginScreenProtocol?.tappedLoginButton()
    }
    
    @objc private func tappedRegisterButton() {
        self.loginScreenProtocol?.tappedRegisterButton()
    }
    
    func validateTextFields() {
        
        let loginTextField = self.loginTextField.text ?? ""
        let passwordTextField = self.passwordTextField.text ?? ""
        if !loginTextField.isEmpty && !passwordTextField.isEmpty {
            configButtonEnable(true)
        } else {
            configButtonEnable(false)
        }
    }
    
    func configButtonEnable(_ enable: Bool) {
        if enable {
            self.loginButton.setTitleColor(.black, for: .normal)
            self.loginButton.isEnabled = true
        } else {
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
        }
    }
    
    func getPasswordTF() -> String {
        return self.passwordTextField.text ?? ""
    }
    
    func getEmailTF() -> String {
        return self.loginTextField.text ?? ""
    }
    
}

// MARK: - UITextFieldDelegate
extension LoginScreen: UITextFieldDelegate {}

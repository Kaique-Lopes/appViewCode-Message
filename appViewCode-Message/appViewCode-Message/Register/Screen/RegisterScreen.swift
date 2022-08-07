//
//  RegisterScreen.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 23/06/22.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
// MARK: Componentes
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu E-mail"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.backgroundColor = .white
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.keyboardType = .emailAddress
        textField.isSecureTextEntry = false
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite sua Senha"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.backgroundColor = .white
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.keyboardType = .default
        textField.isSecureTextEntry = false
        return textField
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        button.backgroundColor = .white
        button.setTitleColor(.lightGray, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.isEnabled = false
        return button
    }()
    
    // MARK: Inicializador
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupAllConstraints()
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAllConstraints() {
        setupUserImageConstraint()
        setupEmailTextFieldConstraint()
        setupPasswordTextFieldConstraint()
        setupRegisterButtonConstraint()
    }

    // MARK: Função que agrupa todos os componentes.
    private func setupViews() {
        self.addSubview(userImage)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(registerButton)
    }
    
    func setupUserImageConstraint() {
        self.userImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
    }
    
    func setupEmailTextFieldConstraint() {
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.userImage.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    func setupPasswordTextFieldConstraint() {
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(15)
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(50)
        }
    }
    
    func setupRegisterButtonConstraint() {
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(15)
            make.leading.equalTo(self.passwordTextField.snp.leading)
            make.trailing.equalTo(self.passwordTextField.snp.trailing)
            make.height.equalTo(45)
        }
    }
    
    func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    func validateTextFields() {
        
        let emailTextField = self.emailTextField.text ?? ""
        let passwordTextField = self.passwordTextField.text ?? ""
        
        if !emailTextField.isEmpty && !passwordTextField.isEmpty {
            configButtonEnable(true)
        } else {
            configButtonEnable(false)
        }
        
    }
    
    func configButtonEnable(_ enable: Bool) {
        
        if enable {
            self.registerButton.setTitleColor(.black, for: .normal)
            self.registerButton.isEnabled = true
        } else {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    func getPasswordTF() -> String {
        return self.passwordTextField.text ?? ""
    }
    
    func getEmailTF() -> String {
        return self.emailTextField.text ?? ""
    }
    
}

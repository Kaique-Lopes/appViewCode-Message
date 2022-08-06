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
        setupConstraints()
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Função que agrupa todos os componentes.
    private func setupViews() {
        self.addSubview(userImage)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(registerButton)
    }
    
    // MARK: Função que realiza a configuração de constraints de todos os componentes na view.
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.userImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            self.userImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.userImage.widthAnchor.constraint(equalToConstant: 100),
            self.userImage.heightAnchor.constraint(equalToConstant: 100),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.userImage.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.passwordTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 50),

        ])
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
    
}

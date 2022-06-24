//
//  LoginViewController.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 31/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    var loginScreen: LoginScreen?
    
    // MARK: - Life Cycle
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = loginScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        loginScreen?.loginScreenDelegate(delegate: self)
        loginScreen?.loginTextField.delegate = self
        loginScreen?.passwordTextField.delegate = self
    }
}

// MARK: -  UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("abriu teclado")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("fechou teclado")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

// MARK: - LoginScreenProtocol
extension LoginViewController: LoginScreenProtocol {
    func tappedLoginButton() {
        print("aeeer login")
    }
    
    func tappedRegisterButton() {
        self.navigationController?.pushViewController(RegisterVC(), animated: true)
    }
}

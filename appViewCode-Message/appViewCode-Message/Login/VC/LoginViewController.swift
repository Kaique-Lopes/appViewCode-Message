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
        loginScreen?.loginTextField.delegate = self
        loginScreen?.passwordTextField.delegate = self
    }
}

// MARK: -  UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

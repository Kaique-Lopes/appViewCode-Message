//
//  LoginViewController.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 31/05/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert: Alert?
    
    // MARK: - Life Cycle
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        loginScreen?.loginScreenDelegate(delegate: self)
        loginScreen?.configTextFieldsDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
}

// MARK: -  UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("abriu teclado")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

// MARK: - LoginScreenProtocol
extension LoginViewController: LoginScreenProtocol {
    func tappedLoginButton() {
        let home = HomeVC()
        self.navigationController?.pushViewController(home, animated: true)
//        guard let login = self.loginScreen else {return}
//
//        self.auth?.signIn(withEmail: login.getEmailTF(), password: login.getPasswordTF(), completion: { result, error in
//            if error != nil {
//                self.alert?.getAlert(title: "Atenção", message: "Dados incorretos, verifique e tente novamente!")
//            } else {
//                if result == nil {
//                    self.alert?.getAlert(title: "Atenção", message: "Houve algum erro inesperado, tente novamente mais tarde!")
//                } else {
//                    self.alert?.getAlert(title: "Parabéns", message: "Usuario Logado com Exito")
//                }
//            }
//        })
    }
    
    func tappedRegisterButton() {
        self.navigationController?.pushViewController(RegisterVC(), animated: true)
    }
}

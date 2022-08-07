//
//  RegisterVC.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 23/06/22.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    var registerScreen: RegisterScreen?
    var auth: Auth?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        registerScreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RegisterVC: RegisterScreenProtocol {
    
    func actionRegisterButton() {
        let emailTF: String = self.registerScreen?.emailTextField.text ?? ""
        let passwordTF: String = self.registerScreen?.passwordTextField.text ?? ""
        
        self.auth?.createUser(withEmail: emailTF, password: passwordTF, completion: { result, error in
            if error != nil {
                print("error no servidor")
            }else {
                print("sucesso ao cadastrar")
            }
        })
    }
}

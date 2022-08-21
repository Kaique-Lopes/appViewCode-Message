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
    var alert: Alert?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
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
        guard let register = self.registerScreen else {return}

        self.auth?.createUser(withEmail: register.getEmailTF(), password: register.getPasswordTF(), completion: { result, error in
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Erro ao cadastrar, verique os dados e tente novamente")
            }else {
                self.alert?.getAlert(title: "Parabéns", message: "Conta Criada com Sucesso!", completion: {
                    self.navigationController?.popViewController(animated: true)
                })
            }
        })
    }
}

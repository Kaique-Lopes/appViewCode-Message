//
//  LoginViewController.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 31/05/22.
//

import UIKit

class LoginViewController: UIViewController {

    var loginScreen: LoginScreen?
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = loginScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}


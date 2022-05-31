//
//  LoginScreen.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 31/05/22.
//

import UIKit

class LoginScreen: UIView {

    lazy var loginLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(loginLabel)
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.loginLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}

//
//  LoginScreen.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 31/05/22.
//

import UIKit

class LoginScreen: UIView {
    
// MARK: - Components
    lazy var loginLabel = LabelDefault(text: "Login")
    lazy var logoImage = UIImageDefault(imageName: "logo")
    
    // MARK: - Overrides
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(loginLabel)
        self.addSubview(logoImage)
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.loginLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.logoImage.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor)
        ])
    }
    
}

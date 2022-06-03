//
//  UITextField.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 02/06/22.
//

import Foundation
import UIKit

class UITextFieldDefault: UITextField {
    init(text: String, keyboardType: UIKeyboardType = .default, isSecure: Bool = false) {
        super.init(frame: .zero)
        initDefault(text: text)
        self.keyboardType = keyboardType
        self.isSecureTextEntry = isSecure
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func initDefault(text: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.placeholder = text
        self.autocorrectionType = .no
        self.borderStyle = .roundedRect
        self.textColor = .darkGray
    }
}

//
//  UITextField.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 02/06/22.
//

import Foundation
import UIKit

class UITextFieldDefault: UITextField {
    init(text: String) {
        super.init(frame: .zero)
        
        initDefault(text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initDefault(text: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .cyan
        self.placeholder = text
    }
}

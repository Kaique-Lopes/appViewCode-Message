//
//  UIButtonDefault.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 06/06/22.
//

import Foundation
import UIKit

class UIButtonDefault: UIButton {
    init(text: String, bgColor: UIColor = .white, colorTitle: UIColor = .black, forColor: UIControl.State = .normal) {
        super.init(frame: .zero)
        initDefault(text: text)
        self.backgroundColor = bgColor
        self.setTitleColor(colorTitle, for: forColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(text: String) {
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(text, for: .normal)
        backgroundColor = .white
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
        setTitleColor(.black, for: .normal)
        clipsToBounds = true
        layer.cornerRadius = 7.0
    }
}

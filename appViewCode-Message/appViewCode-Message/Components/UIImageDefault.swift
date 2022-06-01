//
//  UIImageDefault.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 01/06/22.
//

import Foundation
import UIKit

class UIImageDefault: UIImageView {
    init(imageName: String) {
        super.init(frame: .zero)
        
        initDefault(imageName: imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(imageName: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFit
        self.image = UIImage(named: imageName)
    }
}

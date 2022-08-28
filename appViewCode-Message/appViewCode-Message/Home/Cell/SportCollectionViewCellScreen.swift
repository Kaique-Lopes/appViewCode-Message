//
//  SportCollectionViewCellScreen.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes on 27/08/22.
//

import UIKit

class SportCollectionViewCellScreen: UIView {

    lazy var viewBackGround: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViews() {
        self.addSubview(viewBackGround)
    }
    
    func configViewBackGroundConstraint() {
        self.viewBackGround.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

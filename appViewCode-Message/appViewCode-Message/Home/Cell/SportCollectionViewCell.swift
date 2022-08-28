//
//  SportCollectionViewCell.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes on 27/08/22.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "SportCollectionViewCell"
    
    let sportCollectionViewCellScreen: SportCollectionViewCellScreen = SportCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configSportCollectionViewCellScreenConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViews() {
        self.sportCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(sportCollectionViewCellScreen)
    }
    
    func configSportCollectionViewCellScreenConstraints() {
        self.sportCollectionViewCellScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

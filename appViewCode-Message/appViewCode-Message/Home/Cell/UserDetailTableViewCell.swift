//
//  UserDetailTableViewCell.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 21/08/22.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {

    static let identifier: String = "UserDetailTableViewCell"
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configContentViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configContentViews() {
        self.contentView.addSubview(userImageView)
        self.contentView.addSubview(nameLabel)
    }
    
    func setupCell(data: DataUser) {
        self.userImageView.image = UIImage(named: data.nameImage)
        self.nameLabel.text = data.name
    }
    
    func configConstraints() {
        self.constraintsUserImageView()
        self.constraintNameLabel()
    }
    
    func constraintsUserImageView() {
        self.userImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(90)
            make.height.equalTo(90)
        }
    }
    
    func constraintNameLabel() {
        self.nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.userImageView.snp.trailing).offset(20)
        }
    }
}

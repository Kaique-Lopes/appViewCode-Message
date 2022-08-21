//
//  HomeScreen.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 17/08/22.
//

import UIKit
import SnapKit

class HomeScreen: UIView {
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserDetailTableViewCell.self, forCellReuseIdentifier: UserDetailTableViewCell.identifier)
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViews()
        self.setupConstraints()
    }
    
    func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    func addSubViews() {
        addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        tableViewConstraints()
    }
    
    func tableViewConstraints() {
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}

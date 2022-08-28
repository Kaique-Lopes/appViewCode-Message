//
//  HomeScreen.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 17/08/22.
//

import UIKit
import SnapKit

class HomeScreen: UIView {
    // MARK: - Criação do component tableView
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
    // MARK: - Registro da celula na tableView -> UserDetailTableViewCell
        tableView.register(UserDetailTableViewCell.self, forCellReuseIdentifier: UserDetailTableViewCell.identifier)
        tableView.register(SportTableViewCell.self, forCellReuseIdentifier: SportTableViewCell.identifier)
        tableView.backgroundColor = .white
        return tableView
    }()
    
        // MARK: - Inicializador com as views que são adicionadas e constraints
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViews()
        self.setupConstraints()
    }
    
        // MARK: - Criação do Protocolo para passar para a viewcontroller assinar
    func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
        // MARK: - adicionando a tableView na view
    func addSubViews() {
        addSubview(tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        // MARK: - criação da funcao para chamar a constraint dos elementos
    func setupConstraints() {
        tableViewConstraints()
    }
    
        // MARK: - criando a constraint do elemento
    func tableViewConstraints() {
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}

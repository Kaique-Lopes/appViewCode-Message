//
//  HomeVC.swift
//  appViewCode-Message
//
//  Created by Kaique Lopes de Oliveira on 17/08/22.
//

import UIKit

class HomeVC: UIViewController {
    var homeScreen: HomeScreen?
    var data: [DataUser] = [DataUser(name: "Kaique", nameImage: "menino1"),
                            DataUser(name: "Luis", nameImage: "menino2"),
                            DataUser(name: "Ana", nameImage: "menina1")]
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setupCell(data: data[indexPath.row])
        return cell ?? UITableViewCell()
    }

}

extension HomeVC: UITableViewDelegate {
    
}

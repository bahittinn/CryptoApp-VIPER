//
//  View.swift
//  CryptoApp-VIPER
//
//  Created by Bahittin on 27.10.2023.
//

import UIKit

protocol AnyView {
    var presenter: AnyPresenter? {get set}
    
    func Update(with crptos: [Crypto])
    func Update(with error: String)
}

class CryptoViewController: UIViewController {
    var presenter: AnyPresenter?
    var cryptos: [Crypto] = []
    
    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.isHidden = true
        return tableview
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.isHidden = false
        label.text = "Downloading.."
        label.font = .systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        view.backgroundColor = .yellow
        
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        messageLabel.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 50, width: 200, height: 50)
    }
}

extension CryptoViewController: AnyView {
    func Update(with crptos: [Crypto]) {
        DispatchQueue.main.async {
            self.cryptos = crptos
            self.messageLabel.isHidden = true
            self.tableView.isHidden    = false
        }
    }
    
    func Update(with error: String) {
        
    }
}

extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = cryptos[indexPath.row].currency
        return cell
    }
}

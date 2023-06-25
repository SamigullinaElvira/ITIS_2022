//
//  CatalogViewController.swift
//  OnlineShop
//
//  Created by Teacher on 11.02.2023.
//

import UIKit

@MainActor
class CatalogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet private var tableView: UITableView!
    
    var presenter: CatalogPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        presenter.view = self
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        Task {
            try await presenter.download()
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.productsCount
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        presenter.setCellConfiguration(cell: cell, row: indexPath.row)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navigationController = navigationController else { return }
        presenter.showDetails(navigation: navigationController, row: indexPath.row)
    }
    
    func reload() {
        tableView.reloadData()
    }
}

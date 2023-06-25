//
//  ViewController.swift
//  inst
//
//  Created by Эльвира Самигуллина on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {
    private lazy var mainTableView = UITableView(frame: .zero, style: .insetGrouped)

    var data: [UserData] = []
    var accounts: [Account] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mainTableView)
        mainTableView.dataSource = self
        setConstraints()
        fetchData()
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: ide.mainCell.rawValue)
    }

    private func fetchData() {
        Task {
            do {
                accounts = try await NetworkManager.shared.getAccounts()

                mainTableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    enum ide: String {
        case mainCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value2, reuseIdentifier: ide.mainCell.rawValue)
        var configuration = UIListContentConfiguration.cell()

        let name = accounts[indexPath.row].user.name

        configuration.text = name
        cell.contentConfiguration = configuration

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let profileVC = storyboard?.instantiateViewController(withIdentifier: "InstantgramViewController") as? InstantgramViewController else { return }
        
        profileVC.modalPresentationStyle = .fullScreen
        present(profileVC, animated: true)
    }
}

extension ViewController {
    private func setConstraints() {
        mainTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


//
//  PlayersViewController.swift
//  exam
//
//  Created by Эльвира Самигуллина on 14.01.2023.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var players =  [String]()
    var team: Team?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let player = players[indexPath.row]
        var configuration = UIListContentConfiguration.cell()
        configuration.text = player
        cell.contentConfiguration = configuration
        return cell
    }
    
    private let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        fetchData()
        setup()
    }

    func setup(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        navigationItem.title = team?.name
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PlayerCell")
        tableView.dataSource = self
        tableView.reloadData()
        tableView.delegate = self
    }

//    func fetchData(){
//        guard let url = URL(string: "https://raw.githubusercontent.com/AZigangaraev/Exam2022-1/main/var2.json")
//        else { return }
//
//        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//            guard let dataRespone = data else { return }
//
//            do {
//                let modelData = try JSONDecoder().decode([Team].self, from: dataRespone)
//
//                for team in modelData {
//                    self.teams.append(team.name)
//                }
//            } catch {
//                print(error)
//            }
//        }
//        tableView.reloadData()
//        task.resume()
//    }
}


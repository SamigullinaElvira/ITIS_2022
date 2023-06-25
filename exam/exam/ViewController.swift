//
//  ViewController.swift
//  exam
//
//  Created by Эльвира Самигуллина on 14.01.2023.
//

import UIKit

////class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
////    @IBOutlet private var tableView: UITableView!
////
////    private let cellIdentifier: String = "Cell"
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////    }
////
////    func tableView(
////        _ tableView: UITableView,
////        cellForRowAt indexPath: IndexPath
////    ) -> UITableViewCell {
////        let team = fetchedResults.object(at: indexPath)
////        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
////        var contentConfiguration = UIListContentConfiguration.valueCell()
////        contentConfiguration.text = team.name ?? "Unnamed"
////        cell.contentConfiguration = contentConfiguration
////        return cell
////    }
////
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        tableView.deselectRow(at: indexPath, animated: true)
////        let team = fetchedResults.object(at: indexPath)
////        show(team: team)
////    }
////
////
////}
//
////class ViewController: UIViewController {
////    private lazy var mainTableView = UITableView(frame: .zero, style: .insetGrouped)
////
////    var teams: [Team] = []
////    var players: [Player] = []
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
////
////        view.addSubview(mainTableView)
////        mainTableView.dataSource = self
////        fetchData()
////        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: ide.mainCell.rawValue)
////    }
////
//////    private func fetchData() {
//////        Task {
//////            do {
//////                teams = try await NetworkManager.shared.getTeams()
////////                print("teams: ")
////////                print(teams)
//////                mainTableView.reloadData()
//////            } catch {
//////                print(error)
//////            }
//////        }
//////    }
////
////    private func fetchData() {
////            let url = URL(string: "https://raw.githubusercontent.com/AZigangaraev/Exam2022-1/main/var2.json")
////            let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
////                guard let data = data, error == nil else {
////                    print("Error Occured While Access Data")
////                    return
////                }
////
////                var mList = [Team]()
////                do {
////                    mList = try JSONDecoder().decode([Team].self, from: data)
////                } catch {
////                    print("Error While Decoding JSON into Swift Structure\(error)")
////                }
////
////                self.teams = mList
////                DispatchQueue.main.async {
////                    self.mainTableView.reloadData()
////                }
////            })
////            task.resume()
////        }
////}
////
////extension ViewController: UITableViewDataSource {
////    enum ide: String {
////        case mainCell
////    }
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return teams.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = UITableViewCell(style: .value2, reuseIdentifier: ide.mainCell.rawValue)
////        var configuration = UIListContentConfiguration.cell()
////
////        let name = teams[indexPath.row].name
////        print(teams[indexPath.row])
////        print("1")
////        configuration.text = name
////        cell.contentConfiguration = configuration
////
////        return cell
////    }
////
////}
////
//
//class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    private lazy var tableView = UITableView(frame: .zero, style: .insetGrouped)
//
//    private let cellIdentifier: String = "Cell"
//
//    var teams: [Team] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.dataSource = self
//        tableView.delegate = self
//        fetchData()
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
//    }
//
//    private func fetchData() {
//        let url = URL(string: "https://raw.githubusercontent.com/AZigangaraev/Exam2022-1/main/var2.json")
//        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
//            guard let data = data, error == nil else {
//                print("Error Occured While Access Data")
//                return
//            }
//
//            var list = [Team]()
//            do {
//                list = try JSONDecoder().decode([Team].self, from: data)
//            } catch {
//                print("Error While Decoding JSON into Swift Structure\(error)")
//            }
//
//            self.teams = list
//            print("fetchData вызван")
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        })
//        tableView.reloadData()
//        task.resume()
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("количество")
//        print(teams.count)
//        return self.teams.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("Hello")
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
//        var contentConfiguration = UIListContentConfiguration.valueCell()
//        contentConfiguration.text = teams[indexPath.row].name
//        cell.contentConfiguration = contentConfiguration
//        return cell
//    }
//}
//

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var teams =  [Team]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let team = teams[indexPath.row].name
        var configuration = UIListContentConfiguration.cell()
        configuration.text = team
        cell.contentConfiguration = configuration
        return cell
    }
    
    private let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
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
        navigationItem.title = "Супер-менеджер 3000"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.reloadData()
        tableView.delegate = self
    }

    func fetchData(){
        guard let url = URL(string: "https://raw.githubusercontent.com/AZigangaraev/Exam2022-1/main/var2.json")
        else { return }

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let dataRespone = data else { return }

            do {
                let modelData = try JSONDecoder().decode([Team].self, from: dataRespone)

                for team in modelData {
                    self.teams.append(team)
                }
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let newController = UIStoryboard(name: "Main", bundle: nil)
                   .instantiateViewController(identifier: "PlayersViewController") as? PlayersViewController else { return }
        newController.team = teams[indexPath.row]
        navigationController?.pushViewController(newController, animated: true)
    }
}

//
//  TableViewController.swift
//  Homework6
//
//  Created by elya on 22.10.2022.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    private var magazines: [Magazine] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        magazines = (0 ..< 18).map { _ in
            Magazine.random()
        }
        
        tableView.register(
                    UITableViewCell.self,
                    forCellReuseIdentifier: CellIdentifier.simple.rawValue)
        tableView.register(
                    MyTableViewCell.self,
                    forCellReuseIdentifier: CellIdentifier.custom.rawValue)
                                    
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    enum CellIdentifier: String {
            case simple
            case custom
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        if section == 0 {
            return 5
        } else {
            return magazines.count
        }
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        if indexPath.section == 0 {
            let magazine = magazines[indexPath.row]
    
            var configuration = UIListContentConfiguration.cell()
            configuration.text = "\(magazine.name), выпуск № \(magazine.number) \(magazine.year) года"
            configuration.image = UIImage(systemName: "cart.badge.plus")
            if indexPath.row == 2 || indexPath.row == 5 {
                    configuration.secondaryText = "Ограниченное издание"
            }
            guard let cell = tableView
                    .dequeueReusableCell(withIdentifier: CellIdentifier.simple.rawValue
                    ) else { return UITableViewCell() }
            cell.contentConfiguration = configuration
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CellIdentifier.custom.rawValue, for: indexPath
            ) as? MyTableViewCell
            else {
                fatalError("Could not deque cell of type \(MyTableViewCell.self)")
            }
            let magazine = magazines[indexPath.row]
            cell.set(magazine: magazine)
            return cell
        }
    }
    
    func tableView(
            _ tableView: UITableView,
            heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
            UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
            if indexPath.section == 0 {
                return false
            } else {
                return true
            }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            tableView.deselectRow(at: indexPath, animated: true)
            let magazine = tableView.cellForRow(at: indexPath) as? MyTableViewCell
            print("\(magazine!.nameLabel), выпуск №\(magazine!.numberLabel) \(magazine!.yearLabel) года, количество страниц: \(magazine!.pageCountLabel)")
        }
    }
}

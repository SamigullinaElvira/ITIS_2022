//
//  MyTableViewCell.swift
//  Homework6
//
//  Created by elya on 22.10.2022.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }
    
    let nameLabel: UILabel = .init()
    let yearLabel: UILabel = .init()
    let numberLabel: UILabel = .init()
    let pageCountLabel: UILabel = .init()
    let priceLabel: UILabel = .init()
    
    func set(magazine: Magazine) {
        nameLabel.text = magazine.name
        numberLabel.text = "Выпуск № \(magazine.number)"
        yearLabel.text = "\(magazine.year) г."
        pageCountLabel.text = "\(magazine.pageCount) стр."
        priceLabel.text = "\(magazine.price) $"
    }
    
    private func setup() {
        nameLabel.font = .systemFont(ofSize: 20)
        numberLabel.font = .systemFont(ofSize: 10)
        yearLabel.font = .systemFont(ofSize: 10)
        pageCountLabel.font = .systemFont(ofSize: 10)
        priceLabel.font = .systemFont(ofSize: 20)
        
        let secondaryStackView = UIStackView(arrangedSubviews: [ numberLabel, yearLabel, pageCountLabel])
        secondaryStackView.axis = .horizontal
        let textStackView = UIStackView(arrangedSubviews: [ nameLabel, secondaryStackView])
        textStackView.axis = .vertical
        let stackView = UIStackView(arrangedSubviews: [ textStackView, priceLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        
        contentView.addSubview(stackView)
        secondaryStackView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}

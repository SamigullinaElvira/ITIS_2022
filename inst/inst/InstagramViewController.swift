//
//  InstagramViewController.swift
//  inst
//
//  Created by Эльвира Самигуллина on 19.11.2022.
//

import UIKit

class InstantgramViewController: UIViewController {
    
    private let nameLabel: UILabel = .init()
    
    private let avatar: UIImageView = .init()
    private let status: UILabel = .init()
    
    private let posts: UILabel = .init()
    private let followers: UILabel = .init()
    private let following: UILabel = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    private func setup() {
        //    nameLabel.font = .systemFont(ofSize: 20)
        //    posts.font = .systemFont(ofSize: 10)
        //    status.font = .systemFont(ofSize: 10)
        //    followers.font = .systemFont(ofSize: 10)
        //    following.font = .systemFont(ofSize: 20)
        //
        //    let textStackView = UIStackView(arrangedSubviews: [ posts, followers, following])
        //    textStackView.axis = .horizontal
        //
        //    let firstStackView = UIStackView(arrangedSubviews: [ avatar, textStackView])
        //    firstStackView.axis = .horizontal
        //
        //    contentView.addSubview(firstStackView)
        //    textStackView.translatesAutoresizingMaskIntoConstraints = false
        //    firstStackView.translatesAutoresizingMaskIntoConstraints = false
        //
        //    NSLayoutConstraint.activate([
        //        firstStackView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: 10),
        //        firstStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        //        firstStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
        //        firstStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        //        ])
//    }
}

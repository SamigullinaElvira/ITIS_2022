//
//  DetailsViewController.swift
//  OnlineShop
//
//  Created by Эльвира Самигуллина on 17.02.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var detailsLabel: UILabel!

    var presenter: DetailsPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.show()
    }
    
    func show(name: String, details: String) {
        nameLabel.text = name
        detailsLabel.text = details
    }
}

//
//  CatalogViewController.swift
//  Homework4
//
//  Created by elya on 08.10.2022.
//

import UIKit

class CatalogViewController: UIViewController {
    
    var page_number = 1
    
    @IBOutlet private var counter: UILabel!
    @IBOutlet private var browseCatalog: UIButton!
    
    @IBAction func browseCatalogDidTap(_ sender: Any) {
        let nextVC: CatalogViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "CatalogViewController")
        
        nextVC.page_number = page_number + 1
        
        
        navigationController?.pushViewController(nextVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter.text = "Catalog, Page: \(page_number)"
        
        setupConstraints()
    }

    
    private func setupConstraints() {
        counter.textAlignment = .center
        
        NSLayoutConstraint.activate([
            counter.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            browseCatalog.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            browseCatalog.topAnchor.constraint(equalTo: counter.bottomAnchor, constant: 120),
            browseCatalog.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80)
        ])

    }
}

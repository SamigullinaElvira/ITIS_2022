//
//  AnimalImageViewController.swift
//  Homework4
//
//  Created by elya on 08.10.2022.
//

import UIKit

class AnimalImageViewController: UIViewController {
    
    @IBOutlet private var image: UIImageView!
    @IBOutlet private var label: UILabel!
    @IBOutlet private var closeButton: UIButton!
    
    @IBAction func closeDidTap(_ sender: Any) {
        print("closeButtonDidTap")
        presentingViewController?.dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        label.textAlignment = .center
        
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            label.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 50),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30)
        ])

    }
}

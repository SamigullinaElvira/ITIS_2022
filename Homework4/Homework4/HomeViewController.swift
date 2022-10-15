//
//  HomeViewController.swift
//  Homework4
//
//  Created by elya on 08.10.2022.
//

import UIKit

class HomeViewController: UIViewController {
    var username: String?
    
    @IBOutlet private var hello: UILabel!
    @IBOutlet private var browseCatalog: UIButton!
    @IBOutlet private var animalImages: UIButton!
    
    @IBAction func browseCatalogDidTap(_ sender: Any) {
        print("browseCatalogDidTap")
        guard let catalogVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "CatalogViewController") as? CatalogViewController else { return }
        
        navigationController?.pushViewController(catalogVC, animated: true)
    }
    
    @IBAction func AnimalImagesDidTap(_ sender: Any) {
        let AnimalVC: UIViewController = UIStoryboard(name: "Main", bundle: nil)
             .instantiateViewController(identifier: "AnimalImageViewController")
         
        AnimalVC.modalPresentationStyle = .fullScreen
         present(AnimalVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hello.text = "Hello, \(username ?? "someone")"
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        hello.textAlignment = .center

        let stackView = UIStackView(arrangedSubviews: [browseCatalog, animalImages])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            hello.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            stackView.topAnchor.constraint(equalTo: hello.bottomAnchor, constant: 120),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80)
        ])

    }
    
}

class SignOutViewController: UIViewController {
    var username: String?

    @IBOutlet private var hello: UILabel!
    @IBOutlet private var signOutButton: UIButton!
    
    @IBAction func signOutDidTap(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hello.text = "Hello, \(username ?? "someone")"

        setupConstraints()
    }
    
    private func setupConstraints() {
        hello.textAlignment = .center
        
        NSLayoutConstraint.activate([
            hello.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            signOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            signOutButton.topAnchor.constraint(equalTo: hello.bottomAnchor, constant: 120),
            signOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80)
        ])

    }
}

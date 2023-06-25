//
//  ViewController.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//

import UIKit
class FightViewController: UIViewController {
    @IBOutlet
    private var myHealthView: UIProgressView!

    @IBOutlet
    private var enemyHealthView: UIProgressView!
    
    var presenter: FightPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        myHealthView.progress = 1
        enemyHealthView.progress = 1
    }

    @IBAction
    private func basicAttackTap() {
        presenter.basicAttacked()
    }

    @IBAction
    private func magicAttackTap() {
        presenter.magicAttacked()
    }
    
    func myHealthProgressUpdate(myHealth: Int) {
        myHealthView.progress = Float(myHealth)/100
    }
    
    func enemyHealthProgressUpdate(enemyHealth: Int) {
        enemyHealthView.progress = Float(enemyHealth)/100
    }
}


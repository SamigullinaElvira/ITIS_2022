//
//  DetailsPresenter.swift
//  OnlineShop
//
//  Created by Эльвира Самигуллина on 17.02.2023.
//

import UIKit

class DetailsPresenter {
    private var product: Product!
    
    weak var view: DetailsViewController?

    init(product: Product) {
        self.product = product
    }
    
    func show() {
        view?.show(name: product.name, details: product.details)
    }
}

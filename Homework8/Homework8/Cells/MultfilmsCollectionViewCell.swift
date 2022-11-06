//
//  MultfilmsCollectionViewCell.swift
//  Homework8
//
//  Created by Эльвира Самигуллина on 05.11.2022.
//

import UIKit

class MultfilmsCollectionViewCell: UICollectionViewCell {
    
    func set(imageUrl: URL) {
        loadImage(url: imageUrl)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    private let imageView: UIImageView = .init()
    
    private func setup() {
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        imageView.layer.cornerRadius = 30
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
    }

    private var dataTask: URLSessionDataTask?

    private func loadImage(url: URL) {
        imageView.image = nil
        dataTask?.cancel()
        let urlRequest = URLRequest(
            url: url,
            cachePolicy: .returnCacheDataElseLoad
        )
        dataTask = URLSession.shared
            .dataTask(with: urlRequest) { [imageView] data, _, _ in
                guard let data else {
                    print("could not load image")
                    return
                }
                let image = UIImage(data: data)
                DispatchQueue.main.async { [imageView] in
                    guard let image else { return }
                    imageView.image = image
                }
            }
        dataTask?.resume()
    }
}

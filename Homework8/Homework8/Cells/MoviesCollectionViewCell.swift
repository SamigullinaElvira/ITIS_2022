//
//  MoviesCollectionViewCell.swift
//  Homework8
//
//  Created by Эльвира Самигуллина on 05.11.2022.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    func set(label: String, imageUrl: URL) {
        loadImage(url: imageUrl)
        nameLabel.text = label
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
    private let nameLabel: UILabel = .init()
    
    private func setup() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .white
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

//
//  GifExtention.swift
//  FightingSimulator3000
//
//  Created by Полина Рыфтина on 12.03.2023.
//

import UIKit

enum GifError: Error {
    case unknown
}

extension UIImage {
    static func gifImages(resourceName: String) throws -> [UIImage] {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "gif")
        else {
            print("Gif does not exist at that path")
            throw GifError.unknown
        }
        let url = URL(fileURLWithPath: path)
        guard
            let gifData = try? Data(contentsOf: url),
            let source = CGImageSourceCreateWithData(gifData as CFData, nil)
        else {
            print("Could not initialize gif")
            throw GifError.unknown
        }

        var images = [UIImage]()
        let imageCount = CGImageSourceGetCount(source)
        for i in 0 ..< imageCount {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        return images
    }
}


//
//  ViewController.swift
//  GestureRecognizers
//
//  Created by Teacher on 13.05.2023.
//

import UIKit

class MyImageView: UIImageView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        bounds.insetBy(dx: -10, dy: -10).contains(point)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        isUserInteractionEnabled = true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        print("Share is touched")
    }
}

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet
    private var imageView: UIImageView!

    private let hatImageView: UIImageView = UIImageView()

    @IBOutlet
    private var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // UITapGestureRecognizer
        // UISwipeGestureRecognizer
        // UIPinchGestureRecognizer
        // UIPanGestureRecognizer
        let gestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(imageTap)
        )
        imageView.addGestureRecognizer(gestureRecognizer)
        imageView.isUserInteractionEnabled = true

        view.addSubview(hatImageView)
        hatImageView.frame = CGRect(x: 50, y: 200, width: 200, height: 200)
        let gifImages = try! UIImage.gifImages(resourceName: "propeller-pet")
        hatImages = gifImages
        hatImageView.image = gifImages.first

        hatImageView.isUserInteractionEnabled = true
        let panGestureRecognizer = UIPanGestureRecognizer(
            target: self, action: #selector(hatPan)
        )
        hatImageView.addGestureRecognizer(panGestureRecognizer)
    }

    var animationTimer: Timer?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let timer = Timer(
            timeInterval: 0.3, repeats: true
        ) { [weak self] timer in
            guard let self else {
                timer.invalidate()
                return
            }

            animateImages()
        }
        animationTimer = timer
        RunLoop.main.add(timer, forMode: .common)
    }

    private func animateImages() {
        hatImageView.image = hatImages[currentImageIndex]

        currentImageIndex += 1
        if currentImageIndex >= hatImages.count {
            currentImageIndex = 0
        }
    }

    private var hatImages: [UIImage] = []
    private var currentImageIndex: Int = 0

    @objc
    private func imageTap() {
        print("Tapped upon image")
    }

    var offset: CGPoint?

    @objc
    private func hatPan(recognizer: UIGestureRecognizer) {
        let point = recognizer.location(in: view)
        switch recognizer.state {
            case .began:
                let touchLocation = recognizer
                    .location(in: hatImageView)
                offset = CGPoint(
                    x: hatImageView.bounds.width * 0.5,
                    y: hatImageView.bounds.height * 0.5
                )
                .applying(
                    .init(
                        translationX: -touchLocation.x,
                        y: -touchLocation.y
                    )
                )
            case .changed:
                hatImageView.center = point
                    .applying(
                        .init(
                            translationX: offset?.x ?? 0,
                            y: offset?.y ?? 0
                        )
                    )
            case .ended, .cancelled, .possible, .failed:
                break
            @unknown default:
                break
        }
    }
}


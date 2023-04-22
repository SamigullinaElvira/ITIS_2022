//
//  AdView.swift
//  OtherThings
//
//  Created by Teacher on 22.04.2023.
//

import SwiftUI

class AdViewContext: ObservableObject {
    @Published
    var progress: CGFloat = 0

    init() {
        updateProgress()
    }

    private var increasing: Bool = true

    private func updateProgress() {
        if increasing {
            progress += 0.1
        } else {
            progress -= 0.1
        }

        if progress >= 1 || progress <= 0 {
            increasing.toggle()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) { [weak self] in
            self?.updateProgress()
        }
    }
}

struct AdView: View {
    @ObservedObject
    var context: AdViewContext = .init()

    @State
    var textWidth: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            Text("Lorem ipsum dolor sit amet")
                .background(
                    GeometryReader { geometry in
                        Color.clear.onAppear {
                            textWidth = geometry.size.width
                            print(textWidth)
                        }
                    }
                )
                .offset(x: context.progress * (geometry.size.width - textWidth))
                .animation(.default, value: context.progress)
        }
    }
}

struct AdView_Previews: PreviewProvider {
    static var previews: some View {
        AdView()
    }
}

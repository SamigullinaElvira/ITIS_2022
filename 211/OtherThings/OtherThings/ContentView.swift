//
//  ContentView.swift
//  OtherThings
//
//  Created by Teacher on 22.04.2023.
//

import SwiftUI

extension View {
    func myDefaultCornerRadius() -> some View {
        background(Color.blue).cornerRadius(9)
    }
}

struct ContentView: View {
    @State
    var backgroundColor: Color = .purple.opacity(0.3)

    var body: some View {
        ZStack {
            backgroundColor

            VStack {
                GeometryReader { geometryProxy in
                    HStack(spacing: 0) {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                            .frame(width: geometryProxy.size.width * 0.33)
                        Text("Hello, world!")
                            .frame(width: geometryProxy.size.width * 0.67)
                    }
                }
                .frame(height: 200)

                Button {
                } label: {
                    Text("Press me!")
                }
                .onLongPressGesture {
                } onPressingChanged: { pressed in
                    withAnimation(.easeInOut(duration: 0.3)) {
                        backgroundColor = pressed
                        ? .white.opacity(0.3)
                        : .purple.opacity(0.3)
                    }
                }

                HStack {
                    Text("Hello")
                        .padding()
                        .background(Color.red)
                    Text("World")
                        .padding()
                        .background(Color.green)
                        .offset(x: -20)
                }

                ViewThatFits {
                    HStack {
                        Text("HelloHelloHelloHelloHello")
                        Text("WorldWorldWorldWorld")
                    }
                    VStack {
                        Text("HelloHelloHelloHelloHelloHelloHelloHelloHello")
                        Text("WorldWorldWorldWorld")
                    }
                }

                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

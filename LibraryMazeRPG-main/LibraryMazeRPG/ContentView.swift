//
//  ContentView.swift
//  LibraryMazeRPG
//
//  Created by Kevin Buss & Terrence Gainer on 5/3/25.
//  Includes AI-assisted code using ChatGPT then customized to fit the game


import SwiftUI
import SpriteKit

struct ContentView: View {
    @State private var scene: GameScene? = nil
    @State private var showStartScreen = true

    var body: some View {
        GeometryReader { geo in
            ZStack {
                if let scene = scene {
                    SpriteView(scene: scene,
                               transition: .crossFade(withDuration: 0.5),
                               debugOptions: [.showsFPS, .showsNodeCount])
                        .frame(width: geo.size.width, height: geo.size.height)
                        .ignoresSafeArea()
                } else {
                    Color.black.ignoresSafeArea()
                }

                if showStartScreen {
                    VStack(spacing: 24) {
                        Text("📚 Library Maze RPG")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)

                        Text("You're a boy who got lost in an old library.\nCollect glowing pages to find your way out and avoid falling books!")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)

                        Button(action: {
                            startGame(with: geo.size)
                        }) {
                            Text("Start Game")
                                .font(.title2)
                                .padding()
                                .frame(minWidth: 160)
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(12)
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(20)
                    .padding()
                    .transition(.opacity)
                }
            }
        }
    }

    private func startGame(with size: CGSize) {
        let gameScene = GameScene(size: size)
        gameScene.scaleMode = .resizeFill
        scene = gameScene
        withAnimation {
            showStartScreen = false
        }
    }
}


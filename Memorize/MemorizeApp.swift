//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Diogo Santos on 05/08/2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var gameViewModel = MemorizeGameViewModel()
    var body: some Scene {
        WindowGroup {
            MemorizeGameView(gameViewModel: gameViewModel)
        }
    }
}

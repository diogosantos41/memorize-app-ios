//
//  MemorizeGameViewModel.swift
//  Memorize
//
//  Created by Diogo Santos on 07/08/2024.
//

import SwiftUI

class MemorizeGameViewModel: ObservableObject {
    
    typealias Card = MemorizeGameManager<String>.Card
    
    private static let emojis = ["🐸", "👻", "💍", "🎒", "🐱", "🦄", "🪼", "🚛", "🎀", "🔒", "✂️", "🔱", "♻️", "🔔", "💌"]
    
    private static func createGameManager() -> MemorizeGameManager<String> {
        return MemorizeGameManager(numberOfPairsOfCards: 15) { pairIndex in
            if(emojis.indices.contains(pairIndex)) {
                return emojis[pairIndex]
            } else {
                return "🔴"
            }
        }
    }
    
    @Published private var gameManager = createGameManager()
    
    
    var cards: Array<Card> {
        gameManager.cards
    }
    
    var color: Color {
        .orange
    }
    
    func chooseCard(_ card: Card) {
        gameManager.chooseCard(card)
    }
    
    func shuffleCards() {
        gameManager.shuffleCards()
    }
}

//
//  MemorizeGameManager.swift
//  Memorize
//
//  Created by Diogo Santos on 07/08/2024.
//

import Foundation

struct MemorizeGameManager<CardContent> {
    private (set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for index in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(index)
            cards.append(Card(content: content))
            cards.append(Card(content: content))

        }
    }
    
    func chooseCard(_ card: Card) {
        
    }
    
    mutating func shuffleCards() {
        cards.shuffle()
    }
    
    struct Card {
        var isFaceUp: Bool = true
        var isMatchedUp: Bool = false
        let content: CardContent
        
    }
}





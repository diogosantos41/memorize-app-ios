//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Diogo Santos on 07/08/2024.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func chooseCard(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatchedUp: Bool
        var content: CardContent
        
    }
}





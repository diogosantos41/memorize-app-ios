//
//  MemorizeGameManager.swift
//  Memorize
//
//  Created by Diogo Santos on 07/08/2024.
//

import Foundation

struct MemorizeGameManager<CardContent> where CardContent: Equatable {
    private (set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))

        }
    }
    
    var selectedFaceUpCard: Int?
    
    mutating func chooseCard(_ card: Card) {
        if let choosenIndex = cards.firstIndex(of: card) {
            if !cards[choosenIndex].isFaceUp && !cards[choosenIndex].isMatched {
                cards[choosenIndex].isFaceUp = true
                if let potencialMatchIndex = selectedFaceUpCard {
                    if cards[potencialMatchIndex].content == cards[choosenIndex].content {
                        cards[potencialMatchIndex].isMatched = true
                        cards[choosenIndex].isMatched = true
                        selectedFaceUpCard = nil
                    } else {
                        cards[potencialMatchIndex].isFaceUp = false
                        cards[choosenIndex].isFaceUp = false
                        selectedFaceUpCard = nil
                    }
                } else {
                    selectedFaceUpCard = choosenIndex
                }
            }
        }
    }
    
    mutating func shuffleCards() {
        cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "Matched" : "Not Matched")"
        }
        
    }
}





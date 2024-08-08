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

    var firstSelectedFaceUpCard: Int?
    var secondSelectedFaceUpCard: Int?

    mutating func chooseCard(_ card: Card) {
        if let chosenIndex = cards.firstIndex(of: card) {

            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                cards[chosenIndex].isFaceUp = true

                if let firstIndex = firstSelectedFaceUpCard {
                    if let secondIndex = secondSelectedFaceUpCard {
                        if cards[firstIndex].content == cards[secondIndex].content {
                            cards[firstIndex].isMatched = true
                            cards[secondIndex].isMatched = true
                        } else {
                            cards[firstIndex].isFaceUp = false
                            cards[secondIndex].isFaceUp = false
                        }
                        firstSelectedFaceUpCard = chosenIndex
                        secondSelectedFaceUpCard = nil
                    } else {
                        secondSelectedFaceUpCard = chosenIndex
                    }
                } else {
                    firstSelectedFaceUpCard = chosenIndex
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





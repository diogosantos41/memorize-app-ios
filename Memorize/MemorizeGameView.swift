//
//  MemorizeGameView.swift
//  Memorize
//
//  Created by Diogo Santos on 05/08/2024.
//

import SwiftUI

struct MemorizeGameView: View {
    typealias Card = MemorizeGameManager<String>.Card
    @ObservedObject var gameViewModel: MemorizeGameViewModel
    
    private let cardAspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            cards
                .foregroundColor(gameViewModel.color)
            HStack {
                score
                Spacer()
                shuffle
            }
            .font(.largeTitle)
        }
        .padding()
    }
    
    private var score: some View {
        Text("Score: \(gameViewModel.score)")
            .animation(nil)
    }
    
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                gameViewModel.shuffleCards()
            }
        }
    }
    
    private var cards: some View {
        AspectVGrid(gameViewModel.cards, cardAspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                .zIndex(scoreChange(causedBy: card) != 0 ? 1 : 0)
                .onTapGesture {
                    chooseCard(card)
                }
        }
    }
    
    private func chooseCard(_ card: Card) {
        withAnimation {
            let scoreBeforeChoosing = gameViewModel.score
            gameViewModel.chooseCard(card)
            let scoreChange = gameViewModel.score - scoreBeforeChoosing
            lastScoreChange = (scoreChange, card.id)
        }
    }
    
    @State private var lastScoreChange = (0, causedByCardId: "")
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0
        
    }
}

#Preview {
    MemorizeGameView(gameViewModel: MemorizeGameViewModel())
}

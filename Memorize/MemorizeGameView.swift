//
//  MemorizeGameView.swift
//  Memorize
//
//  Created by Diogo Santos on 05/08/2024.
//

import SwiftUI

struct MemorizeGameView: View {
    @ObservedObject var gameViewModel: MemorizeGameViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle") {
                gameViewModel.shuffleCards()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(gameViewModel.cards.indices, id: \.self) { index in
                CardView(gameViewModel.cards[index])
            }
            .aspectRatio(2/3, contentMode: .fit)
            .padding(4)
        }
        .foregroundColor(.green)
    }
}

struct CardView: View {
    
    let card: MemorizeGameManager<String>.Card
    
    init(_ card: MemorizeGameManager<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let cardBase = RoundedRectangle(cornerRadius: 12)
            Group {
                cardBase.fill(.white)
                cardBase.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }.opacity(card.isFaceUp ? 1 : 0)
            cardBase.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    MemorizeGameView(gameViewModel: MemorizeGameViewModel())
}

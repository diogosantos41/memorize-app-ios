//
//  MemorizeGameView.swift
//  Memorize
//
//  Created by Diogo Santos on 05/08/2024.
//

import SwiftUI

struct MemorizeGameView: View {
    @ObservedObject var gameViewModel: MemorizeGameViewModel
    
    private let cardAspectRatio: CGFloat = 2/3

    var body: some View {
        VStack {
            cards
                .animation(.default, value: gameViewModel.cards)
            Button("Shuffle") {
                gameViewModel.shuffleCards()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(gameViewModel.cards, cardAspectRatio) { card in
                    CardView(card)
                        .padding(4)
                        .onTapGesture {
                            gameViewModel.chooseCard(card)
                        }
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
            }
            .opacity(card.isFaceUp ? 1 : 0)
            cardBase.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    MemorizeGameView(gameViewModel: MemorizeGameViewModel())
}

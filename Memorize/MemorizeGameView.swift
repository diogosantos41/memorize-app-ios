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
    private let spacing: CGFloat = 4

    var body: some View {
        VStack {
            cards
                .foregroundColor(gameViewModel.color)
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
                        .padding(spacing)
                        .onTapGesture {
                            gameViewModel.chooseCard(card)
                        }
            }
    }
}



#Preview {
    MemorizeGameView(gameViewModel: MemorizeGameViewModel())
}

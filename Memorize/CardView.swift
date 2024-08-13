//
//  CardView.swift
//  Memorize
//
//  Created by Diogo Santos on 10/08/2024.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemorizeGameManager<String>.Card

    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    private struct Constants {
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
    
    var body: some View {
        Pie(endAngle: .degrees(0))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.spin(duration: 1), value: card.isMatched)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: 1).repeatForever(autoreverses: false)
    }
}

#Preview {
    typealias Card = CardView.Card
    return HStack {
        CardView(Card(content: "X", id: "test1"))
            .foregroundStyle(.green)
        CardView(Card(isFaceUp: true, content: "🔅", id: "test1"))
            .foregroundStyle(.green)
    }.padding()
}

//
//  Cardify.swift
//  Memorize
//
//  Created by Diogo Santos on 10/08/2024.
//

import SwiftUI

struct Cardify: ViewModifier {
    
    let isFaceUp: Bool

    func body(content: Content) -> some View {
        ZStack {
            let cardBase = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            cardBase.strokeBorder(lineWidth: Constants.lineWidth)
                .background(cardBase.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
            cardBase.fill().opacity(isFaceUp ? 0 : 1)
        }
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
    
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}

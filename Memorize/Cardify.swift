//
//  Cardify.swift
//  Memorize
//
//  Created by Diogo Santos on 10/08/2024.
//

import SwiftUI

struct Cardify: ViewModifier, Animatable {
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var rotation: Double
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }

    func body(content: Content) -> some View {
        ZStack {
            let cardBase = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            cardBase.strokeBorder(lineWidth: Constants.lineWidth)
                .background(cardBase.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
            cardBase.fill().opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(rotation), axis: (0,1,0))
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

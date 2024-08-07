//
//  ContentView.swift
//  Memorize
//
//  Created by Diogo Santos on 05/08/2024.
//

import SwiftUI

struct MemorizeGameView: View {
    var gameViewModel: MemorizeGameViewModel
    let emojis = ["🐸", "👻", "💍", "🎒", "🐱", "🦄", "🪼", "🚛", "🎀"]
    var body: some View {
            ScrollView {
                cards
            }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }.aspectRatio(2/3, contentMode: .fit)
        }.foregroundColor(.green)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let cardBase = RoundedRectangle(cornerRadius: 12)
            Group {
                cardBase.fill(.white)
                cardBase.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            cardBase.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    MemorizeGameView()
}

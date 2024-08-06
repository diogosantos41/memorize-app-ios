//
//  ContentView.swift
//  Memorize
//
//  Created by Diogo Santos on 05/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }
        .foregroundColor(.green)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            let cardBase = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                cardBase.fill(.white)
                cardBase.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                cardBase.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

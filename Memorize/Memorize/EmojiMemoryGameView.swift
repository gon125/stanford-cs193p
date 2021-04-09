//
//  ContentView.swift
//  Memorize
//
//  Created by Geonhyeong LIm on 2021/03/19.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        
        Grid(viewModel.cards) { card in
            CardView(card: card)
                .onTapGesture {
                    viewModel.choose(card: card)
                }
                .padding(5)
            //.aspectRatio(0.666, contentMode: .fit)
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geo in
            body(for: geo.size)
        }
        
    }
    // MARK: - Private
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaseUp || !card.isMatched {
            ZStack {
                Pie(startAngle: .degrees(0-90), endAngle: .degrees(110-90), clockwise: true).padding(5).opacity(0.4)
                Text(card.content)
                    .font(.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaseUp)
        }
    }
    // MARK: - Drawing Constants
    private func fontSize(for size: CGSize) -> CGFloat { min(size.width, size.height) * 0.7 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}

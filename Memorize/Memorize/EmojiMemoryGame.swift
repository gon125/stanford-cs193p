//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Geonhyeong LIm on 2021/03/19.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    var pairsOfCards: Int {
        cards.count / 2
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    // MARK: - Private
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: .random(in: 2...5)) { pairIndex in emojis[pairIndex % emojis.count] }
    }
}

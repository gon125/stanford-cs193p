//
//  MemoryGame.swift
//  Memorize
//
//  Created by Geonhyeong LIm on 2021/03/19.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        guard let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) else { return }
        self.cards[chosenIndex].isFaseUp = !self.cards[chosenIndex].isFaseUp
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        
        var isFaseUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

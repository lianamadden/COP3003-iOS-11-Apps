//
//  Concentration.swift
//  Concentration2
//
//  Created by Liana Madden on 9/11/19.
//  Copyright © 2019 Liana Madden. All rights reserved.
//

import Foundation

// model
class Concentration{
    
    var cards =  [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? //optional bc it is nil if there isnt a car face up
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    init(numberOfPairsOfCards: Int){ //init tend to have the same external/internal name
        for _ in 1...numberOfPairsOfCards{
            let card = Card()//this creates a card
            cards += [card, card]
        }
        //TODO: shuffle the cards
    }
}

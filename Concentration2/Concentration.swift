//
//  Concentration.swift
//  Concentration2
//
//  Created by Liana Madden on 9/11/19.
//  Copyright © 2019 Liana Madden. All rights reserved.
// finished the Concentration Game

import Foundation

// model
struct Concentration{
    
    private (set) var cards =  [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let ch = "hello".oneAndOnly
            return cards.indices.filter { cards[$0].isFaceUp}.oneAndOnly
          //  var foundIndex: Int?
        // for index in cards.indices {
          //      if cards[index].isFaceUp {
           //         if foundIndex == nil {
           //             foundIndex = index
            //        } else {
           //             return nil
           //         }
          //      }
         //   }
         //return foundIndex
        }
        set {
        for index in cards.indices {
        cards[index].isFaceUp = (index == newValue)
        }
        }
    } //optional bc it is nil if there isnt a car face up
    
    mutating func chooseCard(at index: Int) {
        assert (cards.indices.contains(index),"Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex] == cards[index]{
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
        assert (numberOfPairsOfCards > 0,"Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards{
            let card = Card()//this creates a card
            cards += [card, card]
        }
        //TODO: shuffle the cards
    }
}
extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

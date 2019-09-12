//
//  Card.swift
//  Concentration2
//
//  Created by Liana Madden on 9/11/19.
//  Copyright © 2019 Liana Madden. All rights reserved.
//

import Foundation
//how the card works
struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{ //cant send to card bc static
        Card.identifierFactory += 1
        return identifierFactory //doesnt need a Card. bc it's in a static struct
    }
    init(){
        self.identifier = Card.getUniqueIdentifier() //calling the static funct

    }
}

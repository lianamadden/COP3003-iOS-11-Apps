//
//  ViewController.swift
//  Concentration2
//
//  Created by Liana Madden on 9/8/19.
//  Copyright © 2019 Liana Madden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2) //doesnt initialize until someone tries to use it by using "lazy"
    
    var flipCount: Int = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("Chosen card was not in cardButtons.")
        }
        
    }
    func updateViewFromModel(){
        for index in cardButtons.indices { //indices is a countable range of int
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5813322268, blue: 0.09839137518, alpha: 0) : #colorLiteral(red: 1, green: 0.5813322268, blue: 0.09839137518, alpha: 1)
                
            }
        }
    }
     var emojiChoices: Array <String> = ["🦃","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
    
    //var emoji = Dictionary<Int,String>() //creates an empty dictionary
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?" //it will return a nil if not right.
    }

}


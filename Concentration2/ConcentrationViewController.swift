//
//  ViewController.swift
//  Concentration2
//
//  Created by Liana Madden on 9/8/19.
//  Copyright © 2019 Liana Madden. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards) //doesnt initialize until someone tries to use it by using "lazy"
    
    var numberOfPairsOfCards: Int { //read only property
            return (cardButtons.count+1)/2
    }
    
    private (set) var flipCount: Int = 0 {
        didSet{
           updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attribute: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: UIColor.black
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attribute)
        flipCountLabel.attributedText = attributedString
    }

    @IBAction private func newGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
        flipCount = 0
        updateViewFromModel()
        
    }
    @IBOutlet private weak var flipCountLabel: UILabel!{
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("Chosen card was not in cardButtons.")
        }
    
    }
    func updateViewFromModel(){
        if cardButtons != nil {
        for index in cardButtons.indices { //indices is a countable range of int
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            }else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5813322268, blue: 0.09839137518, alpha: 0) : #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                
            }
        }
        }
    }
    
    var theme: String? {
        didSet {
            emojiChoices = [theme ?? ""]
            emoji = [:]
            updateViewFromModel()
        }
    }
     //private var emojiChoices = ["🦃","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
     private var emojiChoices = ["🦃😱🙀😈🎃👻🍭🍬🍎"]
    //var emoji = Dictionary<Int,String>() //creates an empty dictionary
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String{
        if emoji[card] == nil, emojiChoices.count > 0{
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?" //it will return a nil if not right.
    }

}
extension Int {
    var arc4random: Int {
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
    }else if self < 0{
        return -Int(arc4random_uniform(UInt32(abs(self))))
    }else{
        return 0
    }
    }
}

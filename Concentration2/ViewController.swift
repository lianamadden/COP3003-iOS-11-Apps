//
//  ViewController.swift
//  Concentration2
//
//  Created by Liana Madden on 9/8/19.
//  Copyright © 2019 Liana Madden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount: Int = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices: Array <String> = ["🎃","👻","🎃","👻"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }else {
            print("Chosen card was not in cardButtons.")
        }
        
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5813322268, blue: 0.09839137518, alpha: 1)
        }else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)        }
    }

}


//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by Liana Madden on 12/3/19.
//  Copyright © 2019 Liana Madden. All rights reserved.
//

import UIKit

class EmojiArtView: UIView {

    var backgroundImage: UIImage? { didSet { setNeedsDisplay()} }
    
    override func draw( _ rect: CGRect) {
        backgroundImage?.draw(in: bounds)
    }
        
        
}

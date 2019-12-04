//
//  EmojiArt.swift
//  EmojiArt
//
//  Created by Liana Madden on 12/3/19.
//  Copyright © 2019 Liana Madden. All rights reserved.
//

import Foundation

struct EmojiArt {
    
    var url: URL
    var emojis = [EmojiInfo]()
    
    struct EmojiInfo {
    let x: Int
    let y: Int
    let text: String
    let size: Int
}

init(url: URL, emojis: [EmojiInfo]) {
    self.url = url
    self.emojis = emojis
}
}

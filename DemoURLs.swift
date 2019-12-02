//
//  DemoURLs.swift
//  Cassini
//
//  Created by Liana Madden on 12/2/19.
//  Copyright © 2019 Liana Madden. All rights reserved.
//

import Foundation

struct DemoURLs {
    static let practice = Bundle.main.url(forResource: "oval", withExtension: "jpeg")
    
    
    static var NASA: Dictionary<String,URL> = {
        let NASAURLStrings = [
            "Cassini" : "https://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg"
        ]
        var urls = Dictionary<String,URL>()
        for(key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}

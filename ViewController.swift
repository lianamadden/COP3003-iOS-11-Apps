//
//  ViewController.swift
//  Cassini
//
//  Created by Liana Madden on 12/2/19.
//  Copyright © 2019 Liana Madden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageURL: URL? {
        didSet {
            ImageView.image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if ImageView.image == nil {
            fetchImage()
        }
    }
    @IBOutlet weak var ImageView: UIImageView!
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                ImageView.image = UIImage(data: imageData)
            }
            
        }
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            if imageURL == nil {
                imageURL = DemoURLs.practice
        }
    }
}


//
//  DocumentInfoViewController.swift
//  EmojiArt
//
//  Created by Liana Madden on 12/4/19.
//  Copyright © 2019 Liana Madden. All rights reserved.
//

import UIKit

class DocumentInfoViewController: UIViewController {

    var document: EmojiArtDocument? {
        didSet { updateUI()}
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    private let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatte()
        formatter.dateaStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    private func updateUI() {
        if sizeLabel != nil, createdLabel != nil,
        let url = document? .fileURL,
            let attributes = try? FileManager.default.attributesOfItem(atPath: url.path) {
            sizeLabel.text = "\attributes[.size] ?? 0) bytes"
            if let created = attributes[.creationDate] as? Date {
                createdLabel.text = shortDateFormatter.string(from: created)
            }
        }
        if thumbnailImageView != nil, let thumbnail = document?.thumbnail {
            thumbnailImageView.image = thumbnail
        }
    }
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
}

//
//  EmojiArtViewController.swift
//  EmojiArt
//
//  Created by Liana Madden on 12/3/19.
//  Copyright © 2019 Liana Madden. All rights reserved.
//

import UIKit

class EmojiArtViewController: UIViewController, UIDropInteractionDelegate {

    
    @IBOutlet weak var dropZone: UIView! {
        didSet {
            dropZone.addInteraction(UIDropInteraction(delegate: self))
        }
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSURL.self) && session.canLoadObjects(ofClass: UIImage.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    private func presentBadURLWarning(for url: URL?) {
        let alert = UIAlertController (
            title: "Image Transfer failed",
            message: "Couldn't transfer the dropped image from it's source",
            preferredStyle: .alert
            )
        alert.addAction(<#T##action: UIAlertAction##UIAlertAction#>,
            title: "Keep warning",
            style: .default
        ))
        alert.addAction(UIAlertAction(
        title: "Stop Warning",
        style: .destructive,
        handler: ((UIAlertAction) -> Void)?
        
        ))
        present(alert, animated: true)

        
    }
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: NSURL.self) { nsurls in
            if let url = nsurls.first as? URL {
                DispatchQueue.global(qos: .userInitiated) .async {
                    if let imageData = try? Data( contentsOf: ufl.imageURL),let image  = UIImage(data: imageData) {
                        self.emojiArtBackgraoundImage = (url, image)
                        self.documentChanged()
                    }
                } else {
                    self.presentBadURLWarning(for: url)
                }
            }
        }
        session.loadObjects(ofClass: UIImage.self) {images in}
    }
    @IBOutlet weak var EmojiArtView: EmojiArtView!
}

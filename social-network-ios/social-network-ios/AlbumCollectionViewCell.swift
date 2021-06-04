//
//  AlbumCollectionViewCell.swift
//  social-network-ios
//
//  Created by Rubens Ferreira Ramos on 04/06/21.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageAlbum: UIImageView!
    
    func setup(image: UIImage) {
        self.imageAlbum.image = image
    }
}

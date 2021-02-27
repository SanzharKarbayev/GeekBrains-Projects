//
//  FriendsPhotoCollectionCell.swift
//  GeekBrains App
//
//  Created by Sanzhar on 03.02.2021.
//

import UIKit

class FriendsPhotoCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var likeButton: LikeButton!
    
    func setData(image: UIImage) {
        photo.image = image
    }
}

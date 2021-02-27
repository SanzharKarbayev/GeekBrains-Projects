//
//  NewsFeedTableViewCell.swift
//  GeekBrains App
//
//  Created by Sanzhar on 17.02.2021.
//

import UIKit

class NewsFeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var postOwner: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var likeButton: LikeButton!
    
    override func prepareForReuse() {
        avatarImage.image = nil
        postOwner.text = nil
        time.text = nil
        postText.text = nil
        postImage.image = nil
    }
    
    func setData(avatar: UIImage, name: String, time: String, text: String?, image: UIImage?) {
        avatarImage.image = avatar
        postOwner.text = name
        self.time.text = time
        postText.text = text
        postImage.image = image
        avatarImage.circleShadow(container: containerView, cornerRadius: avatarImage.frame.width / 2)
    }
}

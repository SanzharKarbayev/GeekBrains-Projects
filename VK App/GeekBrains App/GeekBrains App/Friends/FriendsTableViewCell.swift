//
//  FriendsTableViewCell.swift
//  GeekBrains App
//
//  Created by Sanzhar on 01.02.2021.
//

import UIKit

extension UIImageView {
    func circleShadow(container: UIView, cornerRadius: CGFloat) {
        container.clipsToBounds = false
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.7
        container.layer.shadowRadius = cornerRadius / 4
        container.layer.shadowOffset = CGSize.zero
        container.layer.shadowPath = UIBezierPath(roundedRect: container.bounds, cornerRadius: cornerRadius).cgPath
        container.backgroundColor = .clear
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var friendUsername: UILabel!
    
    func setData(name: String, avatar: UIImage) {
        friendUsername.text = name
        avatarImage.image = avatar
        avatarImage.circleShadow(container: containerView, cornerRadius: avatarImage.frame.width / 2)
    }
}

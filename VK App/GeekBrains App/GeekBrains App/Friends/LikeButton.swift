//
//  LikeButton.swift
//  GeekBrains App
//
//  Created by Sanzhar on 08.02.2021.
//

import UIKit

class LikeButton: UIButton {
    
    var isLiked = false
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
    public func flipLikeState() {
        isLiked = !isLiked
        let image = self.isLiked ? UIImage(systemName: "heart") : UIImage(systemName: "heart.fill")
        setImage(image, for: .normal)
    }
}

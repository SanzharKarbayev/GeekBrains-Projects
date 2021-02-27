//
//  FriendsPhotoCollectionController.swift
//  GeekBrains App
//
//  Created by Sanzhar on 03.02.2021.
//

import UIKit

extension FriendsPhotoCollectionController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: self.view.frame.size.width + 30)
    }
}

class FriendsPhotoCollectionController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let friendPhoto: [UIImage] = [UIImage(systemName: "person")!, UIImage(systemName: "person.fill")!]
    var likes: [UIImage]! = []
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        friendPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendPhotos", for: indexPath) as! FriendsPhotoCollectionCell
        let image = friendPhoto[indexPath.row]
        cell.setData(image: image)
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(tapLikeButton(_:)), for: .touchUpInside)
        cell.likeButton.setImage(likes[indexPath.row], for: .normal)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        likes = [UIImage](repeating: UIImage(systemName: "heart")!, count: friendPhoto.count)
    }
    
    @objc func tapLikeButton(_ sender: UIButton) {
        if likes[sender.tag] == UIImage(systemName: "heart") {
            likes[sender.tag] = UIImage(systemName: "heart.fill")!
        } else {
            likes[sender.tag] = UIImage(systemName: "heart")!
        }
        sender.setImage(likes[sender.tag], for: .normal)
    }
}

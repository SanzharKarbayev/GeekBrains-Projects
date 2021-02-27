//
//  NewsFeedViewController.swift
//  GeekBrains App
//
//  Created by Sanzhar on 17.02.2021.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var likes: [UIImage]! = []
    
    
    let newsArray: [(UIImage, String, String, String?, UIImage?)] = [
        (UIImage(systemName: "person")!, "Example 1", "17.02.2021", nil, UIImage(systemName: "gamecontroller")!),
        (UIImage(systemName: "person.fill")!, "Example 2", "14.02.2021", "Just selebraiting Valentains day!", UIImage(systemName: "heart")!),
        (UIImage(systemName: "person")!, "Example 3", "10.02.2021", "Some stuff to write", nil)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        likes = [UIImage](repeating: UIImage(systemName: "heart")!, count: newsArray.count)
    }
}

extension NewsFeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "News Cell") as! NewsFeedTableViewCell
        
        let newsPost = newsArray[indexPath.row]
        
        cell.setData(avatar: newsPost.0, name: newsPost.1, time: newsPost.2, text: newsPost.3, image: newsPost.4)
        
        if newsPost.4 == nil {
            cell.imageHeightConstraint.constant = 0
        } else {
            cell.imageHeightConstraint.constant = cell.frame.width - 30
        }
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(tapLikeButton(_:)), for: .touchUpInside)
        cell.likeButton.setImage(likes[indexPath.row], for: .normal)
        
        return cell
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

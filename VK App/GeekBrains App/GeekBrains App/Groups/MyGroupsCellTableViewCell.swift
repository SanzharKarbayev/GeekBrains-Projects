//
//  MyGroupsCellTableViewCell.swift
//  GeekBrains App
//
//  Created by Sanzhar on 02.02.2021.
//

import UIKit

class MyGroupsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

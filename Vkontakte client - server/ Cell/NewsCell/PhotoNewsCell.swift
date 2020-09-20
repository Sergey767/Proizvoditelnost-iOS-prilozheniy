//
//  PhotoNewsCell.swift
//  Vkontakte
//
//  Created by Сергей Горячев on 03.09.2020.
//  Copyright © 2020 appleS. All rights reserved.
//

import UIKit

class PhotoNewsCell: UITableViewCell {
    
    static let reuseIdentifier = "PhotoNewsCell"
    
    @IBOutlet weak var imageAvatarNews: UIImageView!
    @IBOutlet weak var userNameNews: UILabel!
    @IBOutlet weak var photoNews: UIImageView!
    @IBOutlet weak var photoButtonView: VkButtons!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

//
//  PostNewsCell.swift
//  Vkontakte
//
//  Created by Сергей Горячев on 03.09.2020.
//  Copyright © 2020 appleS. All rights reserved.
//

import UIKit
import Kingfisher

class PostNewsCell: UITableViewCell {
    
    static let reuseIdentifier = "PostNewsCell"
    
    @IBOutlet weak var imageAvatarNews: UIImageView!
    
    @IBOutlet weak var userNameNews: UILabel!
    
    @IBOutlet weak var postNews: UILabel!
    
    @IBOutlet weak var postButtonView: VkButtons!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
//    func configure(with news: ItemsNews?, owner: ) {
//        guard let uOwner = owner else {
//            return
//        }
//
//        let userName = uOwner.firstName.trimmingCharacters(in: .whitespacesAndNewlines)
//        let groupName  = uOwner.nameGroup.trimmingCharacters(in: .whitespacesAndNewlines)
//
//        userNameNews.text = userName.isEmpty ? groupName : userName
//
//        imageAvatarNews.kf.setImage(with: URL(string: uOwner.photo))
//
//        postNews.text = news.text
//    }
}

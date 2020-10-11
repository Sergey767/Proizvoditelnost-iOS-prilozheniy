//
//  FriendsCell.swift
//  Vkontakte
//
//  Created by Серёжа on 10/07/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit
import Kingfisher

class MyFriendsCell: UITableViewCell {
    
    static let reuseIdentifier = "MyFriendsCell"
    
    @IBOutlet private weak var friendsName: UILabel!
    @IBOutlet private weak var imageAvatar: UIImageView!
    
    public func configure(with friend: User) {
        
        let name = friend.firstName + " " + friend.lastName
        friendsName.text = name
        
        let url = URL(string: friend.avatar)
        imageAvatar.kf.setImage(with: url)
        imageAvatar.layer.cornerRadius = imageAvatar.frame.size.width / 2
        imageAvatar.clipsToBounds = true
    }
}

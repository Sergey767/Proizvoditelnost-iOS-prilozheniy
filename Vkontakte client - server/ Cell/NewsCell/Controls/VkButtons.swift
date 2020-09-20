//
//  VkButtons.swift
//  Vkontakte
//
//  Created by Серёжа on 19/09/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class VkButtons: UIControl {
    
    @IBOutlet weak var likeButton: UIButton! {
        didSet {
            let unlikedImage = UIImage(named: "like")
            self.likeButton.setImage(unlikedImage, for: .normal)
        }
    }
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var commentsButton: UIButton! {
        didSet {
            let commentsImage = UIImage(named: "comments")
            self.commentsButton.setImage(commentsImage, for: .normal)
        }
    }
    
    @IBOutlet weak var commentsLabel: UILabel!
    
    @IBOutlet weak var repostButton: UIButton! {
        didSet {
            let repostImage = UIImage(named: "repost")
            self.repostButton.setImage(repostImage, for: .normal)
        }
    }
    
    @IBOutlet weak var repostLabel: UILabel!
    
    @IBOutlet weak var viewingButton: UIButton! {
        didSet {
            let viewingImage = UIImage(named: "viewing")
            self.viewingButton.setImage(viewingImage, for: .normal)
        }
    }
    
    @IBOutlet weak var viewingLabel: UILabel!
    
}

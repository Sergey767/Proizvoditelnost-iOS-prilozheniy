//
//  ItemsGroups.swift
//  Vkontakte
//
//  Created by Сергей Горячев on 16.09.2020.
//  Copyright © 2020 appleS. All rights reserved.
//

import Foundation
import SwiftyJSON

class ItemsGroups {
    let groupId: Int
    let nameGroup: String
    let photo: String
    
    init(json: JSON) {

        self.groupId = json["groups"]["id"].intValue
        self.nameGroup = json["groups"]["name"].stringValue
        self.photo = json["groups"]["photo_50"].stringValue
    }
}

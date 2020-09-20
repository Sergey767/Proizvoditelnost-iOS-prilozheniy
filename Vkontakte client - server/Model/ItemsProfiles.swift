//
//  ItemsProfiles.swift
//  Vkontakte
//
//  Created by Сергей Горячев on 16.09.2020.
//  Copyright © 2020 appleS. All rights reserved.
//

import Foundation
import SwiftyJSON

class ItemsProfiles {
    let profilesId: Int
    let firstName: String
    let lastName: String
    
    init(json: JSON) {
        self.profilesId = json["profiles"]["id"].intValue
        self.firstName = json["profiles"]["first_name"].stringValue
        self.lastName = json["profiles"]["last_name"].stringValue
    }
}

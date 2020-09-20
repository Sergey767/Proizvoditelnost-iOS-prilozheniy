//
//  ItemsNews.swift
//  Vkontakte
//
//  Created by Сергей Горячев on 11.09.2020.
//  Copyright © 2020 appleS. All rights reserved.
//

import Foundation
import SwiftyJSON

class ItemsNews {
    let sourceId: Int
    let text: String
    
    init(json: JSON) {
        self.sourceId = json["items"]["source_id"].intValue
        self.text = json["items"]["text"].stringValue
    }
}


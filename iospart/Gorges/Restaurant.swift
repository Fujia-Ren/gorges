//
//  Attraction
//  FinalProject
//
//  Created by Sonu Kapoor on 4/26/18.
//  Copyright © 2018 Sonu Kapoor. All rights reserved.
//

import Foundation

import UIKit
import SwiftyJSON

class Restaurant {
    
    var name: String
    var rating: String
    var address1: String
    var address2: String
    var phone: String
    var price: String
    var previewLink: URL
    
    init (name: String, rating: String, address1: String, phone: String, price: String, address2: String, previewLink: URL) {
        
        self.name = name
        self.rating = rating
        self.address1 = address1
        self.address2 = address2
        self.phone = phone
        self.price = price
        self.previewLink = previewLink
    }
    
    init(from json: JSON) {
        self.name = json["name"].stringValue
        self.rating = json["rating"].stringValue
        self.address1 = json["location"]["display_address"][0].stringValue
        self.address2 = json["location"]["display_address"][1].stringValue
        self.phone = json["display_phone"].stringValue
        self.price = json["price"].stringValue
        self.previewLink = json["url"].url!
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

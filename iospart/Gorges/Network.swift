//
//  Network.swift
//  Gorges
//
//  Created by Sonu Kapoor on 5/4/18.
//  Copyright © 2018 Fujia Ren. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

class Network {
    
    private static let endpoint = "http://localhost:5000/restaurants"
    
    static func getRestaurants(withQuery query: String, _ completion: @escaping ([Restaurant]) -> Void) {
        let parameters: Parameters = ["name": query]
        
        Alamofire.request(endpoint, parameters: parameters).validate().responseJSON { (response) in
            switch response.result {
                
            case .success(let json):
                let json = JSON(json)
                var restaurants: [Restaurant] = []
               
               for restaurantJSON in json["businesses"].arrayValue  {
                restaurants.append(Restaurant(from: restaurantJSON))
               }
               restaurants = restaurants.filter {$0.name.lowercased().contains(query.lowercased())}
                
                completion(restaurants)
            
            case .failure(let error):
                print("[Network] Error:", error)
                completion([])
            }
        }
    }
}


//
//  NetworkURLs.swift
//  RestaurantsApp
//
//  Created by iAskedYou2nd on 4/13/21.
//

import Foundation

enum NetworkURLs: String {
    case webPage = "https://www.bottlerocketstudios.com"
    case lunchData = "https://s3.amazonaws.com/br-codingexams/restaurants.json"
    
    var url: URL?{
        return URL(string: self.rawValue)
    }
}

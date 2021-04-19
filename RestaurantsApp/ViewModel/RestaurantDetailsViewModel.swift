//
//  RestaurantDetailsViewModel.swift
//  RestaurantsApp
//
//  Created by iAskedYou2nd on 4/14/21.
//

import Foundation

class RestaurantDetailViewModel {
    
    private let restaurant: Restaurant
    private let service: NetworkService
    
    init(restaurant: Restaurant, service: NetworkService) {
        self.restaurant = restaurant
        self.service = service
    }
    
    var name: String {
        return self.restaurant.name
    }
    
    var category: String {
        return self.restaurant.category
    }
    
    var formattedAddress: String {
        let charArrayAddress = self.restaurant.location.formattedAddress.flatMap{
            "\($0)\n"
        }.dropLast()
        return String(charArrayAddress)
    }
    
    var formattedTelephone: String {
        return self.restaurant.contact?.formattedPhone ?? "Phone Unavailable"
    }
    
    var twitterHandle: String {
        guard let tHandle = self.restaurant.contact?.twitter else { return "Twitter Unavailable" }
        return "@\(tHandle)"
    }
    
    var latitude: Double {
        return self.restaurant.location.lat
    }
    
    var longitude: Double {
        return self.restaurant.location.lng
    }
    
    var formattedMapAnnotationTitle: String {
        return "\(self.restaurant.name)\n\(self.restaurant.location.city), \(self.restaurant.location.state)"
    }
    
    func imageData(completion: @escaping (Data?) -> Void) {
        if let imageData = ImageCache.shared.getImageData(for: self.restaurant.backgroundImageURL) {
            completion(imageData)
            return
        }
        
        self.service.fetchRawData(url: URL(string: self.restaurant.backgroundImageURL)) { [weak self] (result) in
            switch result {
            case .success(let data):
                ImageCache.shared.setImageData(for: self?.restaurant.backgroundImageURL, imageData: data)
                completion(data)
            case .failure(let err):
                print(err)
                completion(nil)
            }
        }
    }
    
}

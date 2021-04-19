//
//  RestaurantsViewModel.swift
//  RestaurantsApp
//
//  Created by iAskedYou2nd on 4/14/21.
//

import Foundation

class RestaurantsViewModel {
    
    private var restaurants: [Restaurant] = [] {
        didSet {
            self.updateHandler?()
        }
    }
    private let service: NetworkService
    
    private var updateHandler: (() -> Void)?
    private var errorHandler: ((Error) -> Void)?

    init(service: NetworkService = NetworkManager()) {
        self.service = service
    }
    
    func bind(updateHandler: @escaping () -> Void, errHandler: @escaping (Error) -> Void) {
        self.updateHandler = updateHandler
        self.errorHandler = errHandler
    }
    
    func launchRestaurants() {
        self.service.fetchDecodableData(url: NetworkURLs.lunchData.url) { [weak self] (result: Result<RestaurantWrapper, Error>) in
            switch result {
            case .success(let res):
                self?.restaurants = res.restaurants
            case .failure(let err):
                self?.errorHandler?(err)
            }
        }
    }
    
    var count: Int {
        return self.restaurants.count
    }
    
    func restaurantDetailViewModel(for index: Int) -> RestaurantDetailViewModel? {
        guard index < self.restaurants.count else { return nil }
        return RestaurantDetailViewModel(restaurant: self.restaurants[index], service: self.service)
    }
    
    func allLatitudes() -> [Double] {
        var latitudes: [Double] = []
        for index in 0..<self.restaurants.count {
            if let lat = self.restaurantDetailViewModel(for: index)?.latitude {
                latitudes.append(lat)
            }
        }
        return latitudes
    }
    
    func allLongitudes() -> [Double] {
        var longitudes: [Double] = []
        for index in 0..<self.restaurants.count {
            if let lng = self.restaurantDetailViewModel(for: index)?.longitude {
                longitudes.append(lng)
            }
        }
        return longitudes
    }
    
    func allFormattedMapAnnotationTitle() -> [String] {
        var titles: [String] = []
        for index in 0..<self.restaurants.count {
            if let title = self.restaurantDetailViewModel(for: index)?.formattedMapAnnotationTitle {
                titles.append(title)
            }
        }
        return titles
    }
    
}



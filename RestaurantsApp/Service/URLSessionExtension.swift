//
//  URLSessionExtension.swift
//  RestaurantsApp
//
//  Created by iAskedYou2nd on 4/14/21.
//

import Foundation

protocol Session {
    func getData(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: Session {
    
    func getData(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.dataTask(with: url) { (data, response, error) in
            completion(data, response, error)
        }.resume()
    }
    
}

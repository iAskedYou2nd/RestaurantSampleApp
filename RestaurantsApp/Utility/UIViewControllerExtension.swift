//
//  UIViewControllerExtension.swift
//  RestaurantsApp
//
//  Created by iAskedYou2nd on 4/14/21.
//

import UIKit

extension UIViewController {
    
    func presentErrorAlertController(for error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(dismiss)
                
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

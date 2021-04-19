//
//  RestaurantCoordinator.swift
//  RestaurantsApp
//
//  Created by iAskedYou2nd on 4/19/21.
//

import UIKit

class AppCoordinator {
    
    let navController: UINavigationController
    let mainVM: RestaurantsViewModel
    
    init(navC: UINavigationController = UINavigationController(), mainVM: RestaurantsViewModel = RestaurantsViewModel()) {
        self.navController = navC
        self.mainVM = mainVM
    }
    
    func start() {
        self.navController.pushViewController(RestaurantsMainViewController(viewModel: self.mainVM), animated: false)
        self.navController.tabBarItem = UITabBarItem(title: "lunch", image: UIImage(named: "tab_lunch"), selectedImage: UIImage(named: "tab_lunch")?.withTintColor(UIColor.white))
    }
    
//    private func
    
}

//
//  UIStackViewExtension.swift
//  RestaurantsApp
//
//  Created by iAskedYou2nd on 4/19/21.
//

import UIKit

extension UIStackView {
    
    convenience init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0.0) {
        self.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
    }
    
}

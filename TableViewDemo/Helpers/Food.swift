//
//  Food.swift
//  TableViewDemo
//
//  Created by Lane Faison on 3/30/18.
//  Copyright © 2018 Lane Faison. All rights reserved.
//

import UIKit

class Food {
    var title: String
    var subtitle: String
    var image: UIImage
    
    init(title: String, subtitle: String, image: UIImage) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}

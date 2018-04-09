//
//  DetailsTableViewController.swift
//  TableViewDemo
//
//  Created by Lane Faison on 4/8/18.
//  Copyright © 2018 Lane Faison. All rights reserved.
//

import UIKit

class DetailsTableViewController: UITableViewController {
    
    var food: Food?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = food?.title
        subtitleLabel.text = food?.subtitle
        imageView.image = food?.image
        
    }
}

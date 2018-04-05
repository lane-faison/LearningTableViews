//
//  TableViewWithSectionsViewController.swift
//  TableViewDemo
//
//  Created by Lane Faison on 3/31/18.
//  Copyright © 2018 Lane Faison. All rights reserved.
//

import UIKit

class TableViewWithSectionsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [FruitsNVeggies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TableView With Sections"
        
        data = FruitsNVeggies.FoodItems()

    }
    
}

extension TableViewWithSectionsViewController: UITableViewDelegate {
    
}

extension TableViewWithSectionsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        let itemSection = data[indexPath.section]
        let item = itemSection.foodItems[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        cell.imageView?.image = item.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
}

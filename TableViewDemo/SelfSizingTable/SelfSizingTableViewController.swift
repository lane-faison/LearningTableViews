//
//  SelfSizingTableViewController.swift
//  TableViewDemo
//
//  Created by Lane Faison on 4/7/18.
//  Copyright © 2018 Lane Faison. All rights reserved.
//

import UIKit

class SelfSizingTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var data: [FruitsNVeggies]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data = FruitsNVeggies.FoodItems()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 128
        tableView.rowHeight = UITableViewAutomaticDimension
    }

}

class SelfSizingCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    
    func setupCell(food: Food) {
        self.titleLabel.text = food.title
        self.subtitleLabel.text = food.subtitle
        self.imageV.image = food.image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.subtitleLabel.text = nil
        self.imageV.image = nil
    }
}

extension SelfSizingTableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SelfSizingCell
        let item = data[indexPath.section].foodItems[indexPath.row]
        cell.setupCell(food: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
}

//
//  TableViewCustomCellViewController.swift
//  TableViewDemo
//
//  Created by Lane Faison on 4/3/18.
//  Copyright © 2018 Lane Faison. All rights reserved.
//

import UIKit

class TableViewCustomCellViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var data: [FruitsNVeggies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        data = FruitsNVeggies.FoodItems()
    }
}

extension TableViewCustomCellViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        let item = data[indexPath.section].foodItems[indexPath.row]
        cell.setCell(food: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
}

//
//  StaticTableViewController.swift
//  TableViewDemo
//
//  Created by Lane Faison on 4/8/18.
//  Copyright © 2018 Lane Faison. All rights reserved.
//

import UIKit

class StaticTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var data: [FruitsNVeggies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        data = FruitsNVeggies.FoodItems()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let destinationVC = segue.destination as! DetailsTableViewController
            destinationVC.food = sender as? Food
        }
    }
}

extension StaticTableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        let food = data[indexPath.section].foodItems[indexPath.row]
        cell.textLabel?.text = food.title
        cell.detailTextLabel?.text = food.subtitle
        cell.imageView?.image = food.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = data[indexPath.section].foodItems[indexPath.row]
        performSegue(withIdentifier: "details", sender: food)
    }
}

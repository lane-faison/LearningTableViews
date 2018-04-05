//
//  TableViewWithInsertViewController.swift
//  TableViewDemo
//
//  Created by Lane Faison on 4/2/18.
//  Copyright © 2018 Lane Faison. All rights reserved.
//

import UIKit

class TableViewWithInsertViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.allowsSelectionDuringEditing = true
        }
    }
    
    var data: [FruitsNVeggies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.rightBarButtonItem = editButtonItem
        
        data = FruitsNVeggies.FoodItems()
    }
}

extension TableViewWithInsertViewController: UITableViewDelegate {
    
}

extension TableViewWithInsertViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let extraCell = isEditing ? 1 : 0
        
        return data[section].foodItems.count + extraCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        if indexPath.row >= data[indexPath.section].foodItems.count && isEditing {
            cell.textLabel?.text = "Add new"
            cell.detailTextLabel?.text = nil
            cell.imageView?.image = nil
        } else {
            let item = data[indexPath.section].foodItems[indexPath.row]
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = item.subtitle
            cell.imageView?.image = item.image
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data[indexPath.section].foodItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
            let newFood = Food(title: "New food", subtitle: "New food description", image: #imageLiteral(resourceName: "oranges.jpg"))
            data[indexPath.section].foodItems.append(newFood)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            tableView.setEditing(true, animated: animated)
            tableView.beginUpdates()
            for (idx, set) in data.enumerated() {
                let indexPath = IndexPath(row: set.foodItems.count, section: idx)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
            tableView.endUpdates()
        } else {
            tableView.setEditing(false, animated: animated)
            tableView.beginUpdates()
            for (idx, set) in data.enumerated() {
                let indexPath = IndexPath(row: set.foodItems.count, section: idx)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if indexPath.row >= data[indexPath.section].foodItems.count && isEditing {
            return .insert
        }
        return .delete
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row >= data[indexPath.section].foodItems.count && isEditing {
            return indexPath
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row >= data[indexPath.section].foodItems.count {
            tableView.deselectRow(at: indexPath, animated: true)
            self.tableView(tableView, commit: .insert, forRowAt: indexPath)
        }
    }
}

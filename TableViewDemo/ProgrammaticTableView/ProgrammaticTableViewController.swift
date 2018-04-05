//
//  ProgrammaticTableViewController.swift
//  TableViewDemo
//
//  Created by Lane Faison on 3/31/18.
//  Copyright © 2018 Lane Faison. All rights reserved.
//

import UIKit

class ProgrammaticTableViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let v = UITableView()
        v.delegate = self
        v.dataSource = self
        v.translatesAutoresizingMaskIntoConstraints = false
        v.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return v
    }()
    
    var data: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Programmatic TableView Controller"
        
        for item in FruitsNVeggies.FoodItems() {
            data.append(contentsOf: item.foodItems)
        }
        
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

extension ProgrammaticTableViewController: UITableViewDelegate {
    
}

extension ProgrammaticTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        let item = data[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        cell.imageView?.image = item.image
        return cell
    }
}

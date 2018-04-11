//
//  SearchTableViewController.swift
//  TableViewDemo
//
//  Created by Lane Faison on 4/10/18.
//  Copyright © 2018 Lane Faison. All rights reserved.
//

import UIKit

class SearchTableViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Food] = []
    var filterData: [Food] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        for item in FruitsNVeggies.FoodItems() {
            data.append(contentsOf: item.foodItems)
        }
        
        filterData = data
    }
}

extension SearchTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            filterData = data
            tableView.reloadData()
            return
        }
        filterData = data.filter({ (food) -> Bool in
            return food.title.contains(searchText)
        })
        tableView.reloadData()
    }
}

extension SearchTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        let item = filterData[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        cell.imageView?.image = item.image
        return cell
    }
}

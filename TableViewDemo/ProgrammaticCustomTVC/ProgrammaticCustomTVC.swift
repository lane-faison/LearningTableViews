//
//  ProgrammaticCustomTVC.swift
//  TableViewDemo
//
//  Created by Lane Faison on 4/5/18.
//  Copyright © 2018 Lane Faison. All rights reserved.
//

import UIKit

class ProgrammaticCustomTVC: UIViewController {
    
    lazy var tableView: UITableView = {
        let v = UITableView()
        v.delegate = self
        v.dataSource = self
        v.translatesAutoresizingMaskIntoConstraints = false
        v.register(ProgrammaticCell.self, forCellReuseIdentifier: "cell")
        return v
    }()
    
    var data: [FruitsNVeggies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data = FruitsNVeggies.FoodItems()
        view.addSubview(tableView)
        title = "Programmatic Cell TableView"
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

extension ProgrammaticCustomTVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProgrammaticCell
        let foodData = data[indexPath.section].foodItems[indexPath.row]
        cell.setData(food: foodData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
}

class ProgrammaticCell: UITableViewCell {
    
    private var foodData: Food? {
        didSet {
            imageV.image = foodData?.image
            title.text = foodData?.title
            subtitle.text = foodData?.subtitle
        }
    }
    
    private lazy var imageV: UIImageView = {
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        contentView.addSubview(imageV)
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
        
        NSLayoutConstraint.activate([
            imageV.widthAnchor.constraint(equalToConstant: 100),
            imageV.heightAnchor.constraint(equalToConstant: 100),
            imageV.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 8),
            imageV.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor),
            title.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 8),
            title.leadingAnchor.constraint(equalTo: imageV.trailingAnchor, constant: 8),
            title.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -8),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            subtitle.leadingAnchor.constraint(equalTo: imageV.trailingAnchor, constant: 8),
            subtitle.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -8),
            subtitle.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: -8)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(food: Food) {
        self.foodData = food
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.imageV.image = nil
        self.title.text = nil
        self.subtitle.text = nil
    }
}

//
//  CustomTableViewCell.swift
//  TableViewDemo
//
//  Created by Lane Faison on 4/4/18.
//  Copyright © 2018 Lane Faison. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    func setCell(food: Food) {
        imageV.image = food.image
        title.text = food.title
        subtitle.text = food.subtitle
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageV.image = nil
        title.text = nil
        subtitle.text = nil
    }

}

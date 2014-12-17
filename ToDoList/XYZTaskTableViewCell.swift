//
//  XYZTaskTableViewCell.swift
//  ToDoList
//
//  Created by Nima Sepehr on 12/13/14.
//  Copyright (c) 2014 Nima Sepehr. All rights reserved.
//

import UIKit

class XYZTaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var compDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  TaskProjectTableViewCell.swift
//  TodoList
//
//  Created by Daniel Pimentel on 17/09/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class TaskProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var line: UIView!
    @IBOutlet weak var checkbox: UIImageView!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var bell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  ProjectsCollectionViewCell.swift
//  TodoList
//
//  Created by Daniel Pimentel on 10/09/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class NewProjectsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgStatus: UIImageView!
    @IBOutlet weak var lblName: UILabel!

    func bind(project: ProjectResponse) {
        lblName.text = project.name
    }
}

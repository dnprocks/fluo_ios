//
//  ProjectsCollectionViewCell.swift
//  TodoList
//
//  Created by Daniel Pimentel on 17/09/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import UIKit

class ProjectsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageProjects: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var taskNumber: UILabel!
    
    func bind(project: ProjectResponse) {
        nameLbl.text = project.name
        taskNumber.text = "\(project.tasks)"
    }
}

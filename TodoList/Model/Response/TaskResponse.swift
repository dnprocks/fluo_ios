//
//  TaskResponse.swift
//  TodoList
//
//  Created by Daniel Pimentel on 13/08/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation


struct TaskResponse: Codable {
    let name: String
    let idProject: String
    let idAccountTo: String
    let description: String
    let tags: String
}

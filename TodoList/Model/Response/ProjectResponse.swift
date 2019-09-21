//
//  ProjectResponse.swift
//  TodoList
//
//  Created by Daniel Pimentel on 10/09/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation

struct ProjectResponse: Codable {
    let id: String
    let name: String
    let tasks: Int
}

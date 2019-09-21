//
//  ProjectApi.swift
//  TodoList
//
//  Created by Daniel Pimentel on 10/09/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation

class ProjectApi {

    private let network: NetworkManager

    init(network: NetworkManager) {
        self.network = network
    }

    func getProjects(token: String, completion: @escaping(Result<[ProjectResponse], Error>) -> Void) {
        network.get(path: "/v1/project", headers: ["token" : token], completion: completion)
    }
    
    func getProjectsById(token: String, completion: @escaping(Result<[ProjectResponse], Error>) -> Void) {
        network.get(path: "/v1/project", headers: ["token" : token], completion: completion)
    }
    
//    "project/{idProject}/tasks"
}


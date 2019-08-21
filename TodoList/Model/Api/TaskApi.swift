//
//  TaskApi.swift
//  TodoList
//
//  Created by Daniel Pimentel on 13/08/19.
//  Copyright © 2019 Felipe Arimateia. All rights reserved.
//

import Foundation

class TaskApi {
    
    private let network: NetworkManager
    
    init(network: NetworkManager) {
        self.network = network
    }
    
    func getTaskByProject(idProject: String, token: String, completion: @escaping(Result<Array<TaskResponse>, Error>) -> Void){
        network.get(path: "/v1/project/\(idProject)/tasks",headers:["token": token], completion: completion)
    }
    
    func addNewTask(task: TaskResponse, token: String, completion: @escaping(Result<Data?, Error>) -> Void){
        let parameters = ["name": task.name,"idProject":task.idProject,"idAccountTo":task.idAccountTo,"description":task.description,"tags":task.tags ]
        network.postWithoutBody(path: "/v1/task", parameters: parameters,headers:["token": token], completion: completion)
    }
    
}
